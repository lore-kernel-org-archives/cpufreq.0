From: Dave Jones <davej@redhat.com>
Subject: Re: [Bug 3600] New: Cpu recognization fails after upgrade from
	2.6.7 to 2.6.9
Date: Tue, 2 Nov 2004 21:10:52 +0000
Message-ID: <20041102211052.GA32732@redhat.com>
References: <200410201413.i9KED718023481@fire-1.osdl.org>
	<20041020154744.GA5372@dreamland.darkstar.lan>
	<20041020180537.17d0dd7c@paraclito.crema>
	<20041020165110.GA6992@dreamland.darkstar.lan>
	<20041021102529.GD22405@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041021102529.GD22405@poupinou.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bruno Ducrot <ducrot@poupinou.org>
Cc: cpufreq@www.linux.org.uk

On Thu, Oct 21, 2004 at 12:25:29PM +0200, Bruno Ducrot wrote:

 > > --- a/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-20 18:46:51.000000000 +0200
 > > +++ b/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-20 18:47:06.000000000 +0200
 > > @@ -597,7 +597,7 @@
 > >  	rdmsrl (MSR_K7_FID_VID_STATUS, fidvidstatus.val);
 > >  
 > >  	/* A K7 with powernow technology is set to max frequency by BIOS */
 > > -	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
 > > +	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.CFID];
 > >  	if (!fsb) {
 > >  		printk(KERN_WARNING PFX "can not determine bus frequency\n");
 > >  		return -EINVAL;
 > > 
 > > 
 > 
 > No.  It's wrong.  Though I *much* prefer the form you submit, this will
 > break other unfortunately, and therefore maxfid have to be used
 > here for now as per AMD documentation (problem is, your bios is broken
 > because it do not respect AMD recomandation since after POST the
 > processor shall be put in max frequencies instead of 800MHz).  In short,
 > there is a need to choose who would be broken here for now, and
 > I have to do the one recommanded by AMD.

Since 2.6.9, I've been getting at least one private mail about this
every few days, so I'd like to get this fixed for 2.6.10.
Some ideas..

- A module parameter to switch between usage of MFID / CFID.
- If cpu_khz is greater than any of the frequencies in the table
  we calculate, use CFID.
  (This might not work as running frequency on battery may be
   in the list of frequencies we calculate)
- Construct tables for _both_ MFID and CFID, and merge the
  results.

 > I'm not sure for now how to implement correctly this, and I don't have
 > time for now to make free developpements, but when I got time, I will
 > try to make a workaround (there is also another trouble with the MFID,
 > since we can not modprobe a second time if the processor is not in max
 > for example, but I don't think it will be so hard to fix).

That just needs 'restore to max on unload' as longhaul did.
Maybe we should make a core function that does that on module
shutdown.

		Dave
