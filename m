From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH][RFC] ondemand governor automatic downscaling
Date: Sun, 6 Mar 2005 16:13:14 -0800
Message-ID: <88056F38E9E48644A0F562A38C64FB600426C6CF@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
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
To: Eric Piel <Eric.Piel@tremplin-utc.net>, cpufreq@zenii.linux.org.uk



The approach looks good. I had tried something like this before. And
this works well as long as we assume that the CPU utilization will be
proportional to the current frequency.

In particular, this will not work well in the following situation:
Assume a server with a constant read/write to disk. Say the CPU computes
something for 40% of time and then issues a I/O and waits for remaining
60% of time (until I/O is complete). This wait is irrespective of CPU
speed. Now if we reduce the frequency to make CPU 70% busy, and CPU will
still wait for IO and overall performance will go down as a result of
the frequency slowdown.=20
This can still happen with 20-80 policy, but the probablity is less.

I am thinking of two possiblities here:
1) Keep ondemand as it is, with a performance oriented frequency
scaling. And add a new governor with this automatic downscaling and with
other features making it a power oriented frequency scaling.
2) Change the ondemand governor itself with these changes.

At present, I am tending towards option 1. But, I would like to get
other opinions on this.

Thanks,
Venki
=20

>-----Original Message-----
>From: Eric Piel [mailto:Eric.Piel@tremplin-utc.net]=20
>Sent: Sunday, March 06, 2005 3:36 PM
>To: cpufreq@zenii.linux.org.uk
>Cc: Pallipadi, Venkatesh
>Subject: [PATCH][RFC] ondemand governor automatic downscaling
>
>Hello,
>
>Here is a new policy for the ondemand governor. The modification=20
>concerns the frequency downscaling. Instead of decreasing to a lower=20
>frequency when the CPU usage is under 20%, this new policy=20
>automatically=20
>scales to the optimal frequency. The optimal frequency being=20
>the lowest=20
>frequency which provides enough power to not trigger the=20
>upscaling policy.
>
>An exemple: let's say you are watching a DVD, this takes 40%=20
>of the cpu=20
>usage when frequency is maximum. With the current governor, the=20
>frequency would be at the maximum, 1Ghz (because when you started the=20
>player, the cpu usage reached, briefly, 100%). With this new=20
>algorithm,=20
>the optimal frequency is computed. The goal is to have a usage of 70%=20
>(=3D=3D 80% minus a delta). Therefore the optimal frequency is=20
>571Mhz, from=20
>this request we get the closest hardware frequency which is on this=20
>computer 700Mhz. We've saved 300Mhz.
>
>The beautifulness of this approach is that, in addition to have a=20
>frequency better fitting the CPU usage, the code is simpler=20
>than before=20
>and, cherry on the cake, there is no need for down_threshold anymore!
>
>Ok, so as you've understood, I'm happy with this new=20
>algorithm. It works=20
>on my computer (speedstep-ich) and it should bring even more=20
>conveniency=20
>with hardware that supports more than 2 frequencies. Does=20
>anyone see any=20
>disavantage in this approach? Venkatesh, what do you think of=20
>incorporating this new algorithm in the ondemand governor?
>
>Eric
>
>PS: This applies on vanilla 2.6.11, after my two previous patches=20
>(although they are not technically required).
>
>--
>Signed-off-by: Eric Piel <eric.piel@tremplin-utc.net>
>
