From: Stefan Hoppe <stefan.hoppe@physik.fu-berlin.de>
Subject: Re: Acer Aspire 1300 buggy BIOS - hardcoded patch
Date: Tue, 1 Jul 2003 16:20:28 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307011620.28916.stefan.hoppe@physik.fu-berlin.de>
References: <HHCIHL$1E3F934F29A61EC7E7E81C8DC7239981@email.it> <200307011534.43538.lbelli@crema.unimi.it>
Reply-To: stefan.hoppe@physik.fu-berlin.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <200307011534.43538.lbelli@crema.unimi.it>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk
Cc: Luigi Belli <lbelli@crema.unimi.it>

> No, for me it works correctly, but after some testing I still experienc=
e
> lower temperatures under Windows XP.
> However, it's better than nothing!

I'm still using rtdvs for frequency switching but the result should be th=
e=20
same.=20

On Startup it tells me that it's on 1400MHz and 1450mV but when I switch =
to=20
these values the temperature and powerconsumption increases. But when I=20
switch to 1400MHz and 1350mV temperature and  power stays on the startupv=
alue=20
(I posted it some month ago). So I use a Voltage 0.1V smaller than my Bio=
s=20
tells me for the max value and it's working. The temperature is the same =
as=20
under Windows. I don't know if this is an rtdvs Problem, but I don't thin=
k=20
so, because x86info gives me the Values I set. It's really strange.  So i=
f=20
you are using the hardcoded patch try to reduce the Voltage a litle bit t=
o=20
get the same values as under Windows.

Stefan
