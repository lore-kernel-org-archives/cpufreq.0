From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: Re: [PATCH][RFC] ondemand governor automatic downscaling
Date: Tue, 8 Mar 2005 23:28:02 +0100
Message-ID: <20050308222759.GA1227@message-id.gmane0305.slipkontur.de>
References: <88056F38E9E48644A0F562A38C64FB600426C6CF@scsmsx403.amr.corp.intel.com>
	<422BA615.1010708@tremplin-utc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
In-Reply-To: <422BA615.1010708@tremplin-utc.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

On Mon, Mar 07, 2005 at 01:53:41AM +0100, Eric Piel wrote:
> Pallipadi, Venkatesh a =E9crit :
> :
> :
> >In particular, this will not work well in the following situation:
> >Assume a server with a constant read/write to disk. Say the CPU computes
> >something for 40% of time and then issues a I/O and waits for remaining
> >60% of time (until I/O is complete). This wait is irrespective of CPU
> >speed. Now if we reduce the frequency to make CPU 70% busy, and CPU will
> >still wait for IO and overall performance will go down as a result of
> >the frequency slowdown.=20

I'm not quite sure this is right...

> >This can still happen with 20-80 policy, but the probablity is less.
> Well, if I understand correctly, we lose time because the harddisk is=20
> waiting for the CPU to do some computing before it can write anything=20
> and the slowest is the CPU, the longer the harddisk will have to wait.=20
> IMHO, this situation seems very unlikely because of all the I/O=20
> virtualisation done by the kernel, including read-ahead and cache. The=20
> harddisk will completely turn asynchronously, 100% of the time, while=20
> the CPU will do computation during 70% of the time instead of 40%, still =

> having idle time. This shouldn't affect global performance. Still, I can =

> be overlooking something, do you have any testcase in mind?

...and i agree with Eric's thoughts. But today was a long day and i am not
very awake right now.
Anyway.
I have this "automatic gearshift ;-)" in the SUSE powersaved since at
least SUSE 9.2 (i am not sure if this one made it into 9.1 and SLES9 or
if it went in after that) and i have never heard of any performance
problems of this sort (and i have heard a lot of people claim that
dynamic cpufreq policies would slow down their machines, but nobody
provided me with numbers to back this up even remotely). So i think this
is the right thing to do and it makes configuration easier: just an
up_threshold and maybe a hysteresis percentage (default 5% in powersaved)
to avoid continuous switching if the cpu load is near the switching
point.

Short: i like it ;-)

> Well, I'd like to avoid as much as possible to have to fork the ondemand =

> governor so I'd like to try to stick to option 2 :-)

maybe it would be possible to get 2 ondemand governors from 3 source
files:
 - an "ondemand core"
 - an "ondemand simple", probably performance oriented with not too much
   tunables
 - an "ondemand mobile" with more sophisticated switching and optimal
   configuration aimed at power saving, less performance oriented.
The reasoning behind this that IMO tuning for performance is easy if you
don't mind a few extra mWh spent, but getting it to run at good
performance but as little power consumption as possible is a little bit
more complex (should we consider "niced" cpu time? automatic selection of
"good" up- and downswitching points etc). I'm not sure if there would be
enough code shared between the two drivers to have an extra "core"
module, but it might help.

For me, as a "mobile devices" guy, the more powersaving, the better but
there are different opinions on this ;-)

Best regards,

    Stefan
--=20
Stefan Seyfried
