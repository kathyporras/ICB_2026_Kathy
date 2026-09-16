message = '' # make an empty variable
for x in [1, 2, 3, 4, 5]:
	if x > 4:
		print (x)
		message = 'x is big'
	else:
		print(x)
		message = 'x is small'
	print(message)
print('All Done!')