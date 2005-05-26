From: Mattia Dongili <malattia@gmail.com>
Subject: Re: DBS enabling on EM64T machine with cpufreqd
Date: Thu, 26 May 2005 15:36:34 +0200
Message-ID: <2fc0cdd2050526063627cd16dc@mail.gmail.com>
References: <88056F38E9E48644A0F562A38C64FB6004D356D0@scsmsx403.amr.corp.intel.com>
Reply-To: Mattia Dongili <malattia@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6004D356D0@scsmsx403.amr.corp.intel.com>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk

On 5/26/05, Pallipadi, Venkatesh <venkatesh.pallipadi@intel.com> wrote:
[...]
> And newer versions of the userspace governors should be able to handle
> SMP processsors. Earlier versions didn't. Not sure which version of
> cpufreqd you are using.

oh well... cpufreqd has never been able to handle the userspace governor.

[...]
> >profile=3Dlo_power [root@ae64 cpufreq]# cpufreqd -D
> >
> >libsys_init() - no batteries found, not a laptop?
[...]

after this message cpufreqd should run correctly considering your
server always ac-on and with no battery.
Anyway, as said you're probably better using the ondemand in-kernel
governor to dinamically scale based on cpuload. You can still use
cpufreqd to apply different limits based other parameters :)

--=20
mattia
:wq!
