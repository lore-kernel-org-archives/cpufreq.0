From: Norbert Preining <preining@logic.at>
Subject: Re: Which cpufreq driver is best for ...
Date: Thu, 4 Sep 2003 11:57:04 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030904095704.GA2082@gamma.logic.tuwien.ac.at>
References: <20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<20030903192749.GA30360@brodo.de>
	<20030903055749.GA21721@gamma.logic.tuwien.ac.at>
	<3F55D261.6010407@basmevissen.nl> <20030903193040.GB30360@brodo.de>
	<20030903195013.GA25291@gamma.logic.tuwien.ac.at>
	<20030903210153.GA19704@brodo.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20030903210153.GA19704@brodo.de>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@www.linux.org.uk

OK, me again. Just for completeness, I now see the point and want to add
some comments:

On Mit, 03 Sep 2003, Dominik Brodowski wrote:
> Unfortunately, I don't have the information for your CPU. But, as a good
> example, let's take the 1.0 GHz Pentium-III-M.=20
>=20
> 100% CPU-usage, 1.0 GHz, Speedstep-High, no throttling:		34.0 W
> 	and let's say the CPU consuming task takes 1 minute to complete.
> 	=3D=3D> for the task you'll need 2.0 kWs [=3DkJ?] of energy.
>=20
> 100% CPU-usage,	700 MHz, Speedstep-Low, no throttling:		16.1 W
> 	--> the CPU consuming task will take 1.43 minutes to complete.
> 	=3D=3D> for the task you'll need 1.4 kWs of energy.

I guess these two values have been taken from some specification (the
values 34.0 and 16.1)?

I want to show that you are right ;-)

Assume that we are running cpuXXX daemon which switches the cpu to the
highest frequency as soon as the load is reasonable high, i.e. someting
is done. So the power consumption in the times where cpu is used is the
same in p4-clockmod and speedstep. I will call this T and S (for
throttling and SpeedStep from now on). Thus, only the `idle' times make
a difference.

Let t be the throttling factor, in our case 0.125, and s be the
speedstep factor (top to low), in our case 0.7. For idle times=20
let c_t the cpu usage level in throttling state, and c_s the cpu usage=20
level in speedstep low state. In our case, we would have
(1)	c_t : c_s =3D s : t =3D 700 : 125 =3D 5.6
obviously, because in T we have a lower frequency, thus the cpu usage
will be higher (is this wrong?) compared to the S state with higher
frequency.

Now for the energy in S and T states:
	S (speedstep low):	W_s =3D 1.2 + ((16.1-1.2)*s*c_s)
	T (throttling):		W_t =3D 2.2 + ((34.0-2.2)*t*c_t)
From (1) we know that
	s*c_s =3D t*c_t
which gives for W_s:
	W_s =3D 1.2 + ((16.1-1.2)*t*c_t)
Now we compare W_t with W_s. First note that=20
	t*c_t always is in [0,1]
since both of them are in [0,1], thus for the border cases
t*c_t =3D 0 and =3D 1, we obtain:
	W_t : W_s [0] =3D 2.2 : 1.2 =3D 1.833
and
	W_t : W_s [1] =3D 34.0 : 16.1 =3D 2.111
which gives, that the power consumption is indeed much higher in
throttling state compared to speedstep low state.

Reason for all this, to make it short: SpeedStep reduces the voltage and
the power consumption of the processor, which saves more energy than
letting the processor run at lower frequency but on the full
voltage/power consumption.

Now one last question: Is this computation complete rubbish? And where
did you get the values for your processor?

Best wishes

Norbert

---------------------------------------------------------------------------=
----
Norbert Preining <preining AT logic DOT at>         Technische Universit=E4=
t Wien
gpg DSA: 0x09C5B094      fp: 14DF 2E6C 0307 BE6D AD76  A9C0 D2BF 4AA3 09C5 =
B094
---------------------------------------------------------------------------=
----
SLOGARIE (n.)
Hillwalking dialect for the seven miles of concealed rough moorland
which lie between what you though was the top of the hill and what
actually is.
			--- Douglas Adams, The Meaning of Liff
