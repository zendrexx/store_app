const express = require('express');
const SubCategory = require('../models/sub_category');
const subCategoryRouter = express.Router();

subCategoryRouter.post('/api/subcategories', async (req, res) => {
    try {
        const { categoryId, categoryName, image, subCategoryName } = req.body;
        const subCategory = new SubCategory({ categoryId, categoryName, image, subCategoryName });
        await subCategory.save();
        res.status(201).send(subCategory);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});

subCategoryRouter.get('/api/subcategories/:categoryName/subcategories', async (req, res) => {
    try {
        //extract the categoryName from the request Url using destructing
        const {categoryName} = req.params;
        
        const subCategories = await SubCategory.find({ categoryName: categoryName });
        
        //check if subcategories were found
        if (!subCategories||subCategories.length === 0) {
            //if no return 404 error
            return res.status(404).json({ message: 'No subcategories found for this category.' });
        }else{
            return res.status(200).json(subCategories);
        }
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});
module.exports = subCategoryRouter;
