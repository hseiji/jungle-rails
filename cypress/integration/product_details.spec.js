
describe('Jungle tests product details', () => {
  beforeEach(() => {
    // Visits Jungle App
    cy.visit('http://0.0.0.0:3000/')
  })

  it("Clicking on a product", () => {
    cy.get('a[href*="/products/12"]').click()
  });


})