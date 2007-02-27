From: "stefano ferri" <ferriste@libero.it>
Subject: Re: [Bug 8081] Conservative governor sets wrong and too high
	sampling rates
Date: Tue, 27 Feb 2007 12:49:21 +0100
Message-ID: <JE4E69$34CFDAE2EA17565934BFEA5A3CDD1785@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: rafalbilski <rafalbilski@interia.pl>
Cc: cpufreq <cpufreq@lists.linux.org.uk>

> > Hi Rafal
> Hi Stefano
> > I think you have not understood what is the core of the problem...
> Maybe. It is weekend and it is late and conservative works >for me.

I was speaking seriously :-| ... Also for me it is working but without th=
e patch  not as I wanted ... But now that I've read the archives of this =
mailing list (sorry I didn't read before...)  I understand a little your =
point of view, even if I disagree on it. I'll tell you why.

Last year the code of conservative was different ad less similar to ondem=
and than now. With that code (I mean a 2.6.14.6) I had these values:

sampling_rate_min 9950000
sampling_rate_max 1360065408

min=3D 9.95 seconds, max 1360. Ok, here there were some problems.
I contacted Alexander Clouther for this problem, and after he sent me fou=
r patches, in pratice the same code that I see on the archive of March 22=
, 2006 of this mailing list. Sorry if I never read the archive, I read me=
ssage here only fom yesterday... So, I read in the message "[patch 2/4 MK=
II] " this:

>By default its ten times less responsive. 

Ok, so the 10x factor compared to ondemand is a choice of developers.
Now I understand that what I thought a bug is not a real bug but a differ=
ent idea about the governor.
I think that a kernel space governor that doesn't make possible a user to=
 set a sampling rate of less than a second is not useful, it is better po=
wernowd+userspace...
A user should be free to choose, if a developer think that the ideal samp=
lig rate is about 1 second, ok, set this a default value but let user fre=
e to set it to 0.1 seconds in example. I cannot do a echo on sampling_rat=
e lower than the value contained in sampling_rate_min.
Correcting that line of code I mentioned above one can choose a value bet=
ween 0.0995 seconds and 9.95. I don't know what should I do with a maximu=
m of 99.5...

I hope we can agree a little on this... If you want the kernel   set a de=
fault value of 1 second ok, but let users free to set it to a vrey lower =
value decreasing the value contained in sampling_rate_min.
Another important question is this: I read that Athlon 64 cpus have a too=
 high latency time to swith form the minimum to the maximum frequency, so=
 the ondemand governor is not a good choice because latency. Why an athlo=
n 64 user could not have a governor increasing rapidly step by step as co=
nservative could do with convenient values of sampling rates? I have not =
a direct experience with such processor.


> I don't like word "rapidly" here. Ondemand is doing things rapidly and =
as 
> result my CPU is near the max frequency most time. Fan is making noise =
:-(

fan starts very rarely also with my version of conservative, ondemand, ye=
s, makes it start for too much time.
Why don't you try?


> Please clarify me this problem. If You have 100% constant load (eg. You=
 
> are compiling Thunderbird) CPU speed is increasing or not? Or Your case=
 is, 
> for example, RTorrent with shedule which is using 100% CPU for 1s at 10=
s 
> interval? Would You like to change CPU frequency for this 1s to higher =

> value?

If the load is constant (as you said, when compiling) conservative increa=
ses frequency, but it takes ten second to pass from 400 Mhz to 2133, it's=
 too much... The governor works but I think it's not very useful for a de=
sktop use if I am not free to set a sampling rate lower than a second...

> You are changing *default* value. If You don't like min value then chan=
ge 
> min value. I disagree with Your change because You are changing *powers=
aver* 
> governor into step-by-step ondemand.

If you think, the default value can remain the same, 1 or 2 seconds as no=
w, but I would have the opportunity to set it to 0.1 seconds for example,=
 while my sampling_rate_min is 995000, it is not possible in this conditi=
on! A conservative governor with the possibility to choose a lower sampli=
ng rate could be useful. As you said, it would be a step-by-step ondemand=
.

Stefano
=0A=0A=0A------------------------------------------------------=0APassa a=
 Infostrada. ADSL e Telefono senza limiti e senza canone Telecom=0Ahttp:/=
/click.libero.it/infostrada27eb07=0A
