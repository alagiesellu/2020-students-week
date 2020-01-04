<table border="1" width="100%">
    <tr>
        <th>Name</th>
        <th>Username</th>
        <th>Group</th>
        <th>Password</th>
        <th>Friend</th>
    </tr>
    @foreach($users as $user)
    <tr style="padding:5px;">
        <td>{{ $user['name'] }}</td>
        <td>{{ $user['username'] }}</td>
        <td>{{ $groups[$user['group']] }}</td>
        <td>{{ $user['visible_password'] }}</td>
        <td>{{ $user['user'] }}</td>
    </tr>
    @endforeach
</table>
