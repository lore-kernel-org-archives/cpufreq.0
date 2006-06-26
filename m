From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: ondemand vs suspend.
Date: Mon, 26 Jun 2006 13:58:34 -0700
Message-ID: <44A04A7A.40406@goop.org>
References: <EB12A50964762B4D8111D55B764A84541D4E87@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <EB12A50964762B4D8111D55B764A84541D4E87@scsmsx413.amr.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: Dave Jones <davej@redhat.com>, pjones@redhat.com, cpufreq@lists.linux.org.uk

Pallipadi, Venkatesh wrote:
> Looks like scaling_max_freq on both CPUs got set to 1000000 somehow. Due
> to that all the frequency changes are failing from then on. If you
> manually write 1833000 to scaling_max_freq, things should come back to
> normal.
>   
Yup.  I'd overlooked that one.

Something very strange is going on.  If I do:

   1. set both CPUs to conservative
   2. set CPU1 to performance
   3. looks OK for a while, then...
   4. CPU1's max speed drops to 1GHz
   5. (then goes back; both CPUs switch to full speed; all kinds of
      strangeness)

I have the gnome cpufreq applet running, but its just reading 
scaling_cur_freq for each CPU.
Hm, and now both CPUs are apparently running at full speed.

If the two cores are in fact locked together, then this config doesn't 
make much sense.  But then, the resulting behaviour doesn't either.

> Now the question is: Why is scaling_max_freq getting set to 1000000.
> There was one patch here from thomas, that fixed a race between _PPC
> call to reduce the freq and some other action in setting cpufreq
> governor was resulting in something like this. But, that patch is
> already in mm1. 
>   
Which mm1?  I'm still running 2.6.17-rc6-mm2, because I'm depending on 
some AHCI suspend/resume patches which haven't been updated yet.  Hm, 
but that change does seem pretty old.

> I guess, there is some other corner case where scaling_max_freq can get
> set.
>   
Yes.  This doesn't appear to be a race with anything, since the 
spontaneous change seems to happen unrelated to anything else, unless 
reading the sysfs entries can cause a problem.

    J
