From: Dominik Brodowski <linux@brodo.de>
Subject: Re: 2.4.22-jl9: speedstep-centrino.o: init_module: No such device
Date: Wed, 27 Aug 2003 10:28:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20030827082847.GA3690@brodo.de>
References: <200308262206.37039.lkml@kcore.org>
	<200308270743.34643.ml@kcore.org> <20030827062052.GA4468@brodo.de>
	<200308271012.54751.ml@kcore.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200308271012.54751.ml@kcore.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan De Luyck <ml@kcore.org>
Cc: cpufreq@www.linux.org.uk

On Wed, Aug 27, 2003 at 10:12:54AM +0200, Jan De Luyck wrote:
> On Wednesday 27 August 2003 08:20, Dominik Brodowski wrote:
> > On Wed, Aug 27, 2003 at 07:43:34AM +0200, Jan De Luyck wrote:
> > > On Tuesday 26 August 2003 22:36, Dominik Brodowski wrote:
> > > > On Tue, Aug 26, 2003 at 10:06:36PM +0200, Jan De Luyck wrote:
> > > > > I just patched my 2.4.22 with this patch - so i can get centrino
> > > > > speedstep support in 2.4 - but it won't load:
> > > > >
> > > > > # modprobe speedstep-centrino
> > > > > /lib/modules/2.4.22-jl9/kernel/arch/i386/kernel/speedstep-centrino.o:
> > > > > init_module: No such device
> > > > >
> > > > > Any ideas?
> > > >
> > > > Could you post your /proc/cpuinfo to the cpufreq mailing list at
> > > > cpufreq@www.linux.org.uk, please?
> >
> > Thanks. Here's the (most likely) problem: the -jl kernel patch misses a
> > critical update to the speedstep-centrino module which is necessary to get
> > it loaded. Either get the latest cpufreq CVS sources from
> > http://cvs.arm.linux.org.uk [check for the latest LINUX_2_4 nightly build]
> > and replace -jl9's arch/i386/kernel/speedstep-centrino.c with the version
> > in the linux_2_4 CVS, or contact the -jl maintainer to do the update and
> > release a new -jl kernel.
> 
> Yup, that indeed was the problem. I have another question though: the 
> speedfreq daemon that can change the setting according to the load does not 
> work with the 2.4 implementation since it uses sysfs which is only present in 
> the newer 2.5+ kernels.
> 
> Now; I've got this nice cpu, i got it recognized... how the hell do I change 
> the frequency?? I'm looking on the net; but I'm not able to find any relevant 
> documentation...

echo -n "0%0%100%userspace" > /proc/cpufreq

to enable the userspace governor, and then you can set the frequency in

/proc/sys/cpu/0/speed

	Dominik
