
describe('Jungle tests add product to cart', () => {
  beforeEach(() => {
    // Visits Jungle App
    cy.visit('http://0.0.0.0:3000/')
  })

  it("Checks number of products in cart before adding more", () => {
    cy.get('a[href*="/cart"]').should('contain', 'My Cart (0)')
    // cy.get('[data-cy="cart-test"]').should('contain', 'My Cart (0)')
    
  });

  it("Adding a product to cart", () => {
    cy.get('.btn').contains('Add').click({force: true})
  });


  it("Checking product was added to cart", () => {
    cy.get(".nav-link").should("include.text", "My Cart (0)")
    cy.get(".products .btn")
      .first()
      .click({ force: true })
    cy.get(".nav-link").should("include.text", "My Cart (1)")
  });

})