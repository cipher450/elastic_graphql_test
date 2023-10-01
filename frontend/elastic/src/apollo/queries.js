import gql from "graphql-tag";

export const GET_PRODUCT_BY_NAME_SUGGESTION = gql`
  query GetProductByName($productName: String!) {
    getProductByName(product_name: $productName) {
      product_id
      product_name
      description
      price
      quantity
      is_available
      date_added
    }
  }
`;
export const GET_ALL_PRODUCTS = gql`
  query {
    getAllProducts {
      product_id
      product_name
      description
      price
      quantity
      is_available
      date_added
    }
  }
`;
export const FILTRE_PRODUCTS = gql`
  query filtreProducts(
    $searchTerm: String
    $minPrice: Float
    $maxPrice: Float
    $minQuantity: Int
    $maxQuantity: Int
    $isAvailable: Boolean
    $page: Int
    $pageSize: Int
  ) {
    filtreProducts(
      searchTerm: $searchTerm
      minPrice: $minPrice
      maxPrice: $maxPrice
      minQuantity: $minQuantity
      maxQuantity: $maxQuantity
      isAvailable: $isAvailable
      page: $page
      pageSize: $pageSize
    ) {
      product_id
      product_name
      description
      price
      quantity
      is_available
      date_added
    }
  }
`;
