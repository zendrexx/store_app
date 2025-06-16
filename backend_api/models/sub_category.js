const mongoose = require('mongoose');
const subcategorySchema = mongoose.Schema({
    categoryId: {
        type: String,
        required: true,
    },   
    categoryName: {
        type: String,
        required: true
    },
    image:{
        type:String,
        required:true,
    },
    subCategoryName:{
        type: String,
        required: true
    }
});

const subCategory = mongoose.model('SubCategory',subcategorySchema);
module.exports = subCategory;