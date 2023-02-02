describe('test my resume challenge app', () => {
    beforeEach(() => {
        cy.visit('https://resume.everlycloud.tk')
    })

    it('lambda can trigger counter API & return a 200 status Code', () => {
        cy.request({
          method: 'GET',
          url: 'https://eit2f3u56i.execute-api.us-east-1.amazonaws.com/dev/visitorCounter'
        }).then(response => {
          expect(response.status).to.equal(200)
        })
    })
})