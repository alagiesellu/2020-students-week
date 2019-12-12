class User {

    constructor(data) {
        this.id         = data['id'] || null;
        this.name       = data['name'] || null;
        this.img        = data['img'] || null;
        this.gender     = data['gender'] || null;
        this.group      = data['group'] || null;
        this.is_admin   = data['is_admin'] || false;
        this.username   = data['username'] || null;
        this.about      = data['about'] || null;
    }

    get isNull()
    {
        return this.name === null;
    }

    get getImg()
    {
        return '/storage/' + this.img;
    }

    get getGender()
    {
        return this.gender === 'm' ? 'Male' : 'Female';
    }

    get getGroup()
    {
        return this.group === null ? 'Undefined Group' : window.groups[this.group];
    }
}

export default User;
