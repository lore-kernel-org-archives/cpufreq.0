From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] longhaul
Date: Wed, 20 Apr 2005 14:47:21 -0400
Message-ID: <20050420184721.GL2476@redhat.com>
References: <3EFE14A8A1A82D4BB867A48A01A88ED708A096@waglmb01.labs.agilent.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <3EFE14A8A1A82D4BB867A48A01A88ED708A096@waglmb01.labs.agilent.com>
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
Content-Transfer-Encoding: 7bit
To: ken_staton@agilent.com
Cc: cpufreq@lists.linux.org.uk

On Wed, Apr 20, 2005 at 11:18:20AM -0700, ken_staton@agilent.com wrote:

 > > I wonder if the ide layer should have a way to quiesce dma that
 > > we can use instead of doing this here.
 > > Maybe it already does, I'm not too familiar with its internals.
 > i'll look again. i didn't find a more direct way. 

If it doesn't exist, it's worth bringing this up with the IDE folks
at linux-ide@vger.kernel.org to be sure theres no other evil
ide gotchas we need to know about.  This still doesn't solve the
problem of DMA from SATA / SCSI though.  Any ideas ?

 > > This bit bothers me a little, as we're not saving any state
 > > to record whether the devices had mastering enabled.
 > 
 > state is saved here:
 > >  > +			cmd_state[i++] = pci_cmd;

Doh, somehow I completely misread that. looks fine.
 
 > > Also, from my reading of the PCI spec, if we disable mastering
 > > in the root bridge, every device downstream of that should
 > > also be transparently disabled. Can you try that ?
 > the root bridge command register is read only.
 > use setpci -s 0:0.0 4.w to confirm

Hmm, I was sure I read otherwise in the spec/mindshare book.
I'll have another read of that when I get home.

 > >  >  	longhaul->bits.EnableSoftBusRatio = 0;
 > >  >  	longhaul->bits.RevisionKey = version;
 > >  > -	local_irq_disable();
 > >  > +
 > >  >  	wrmsrl(MSR_VIA_LONGHAUL, longhaul->val);
 > >  > -	local_irq_enable();
 > >  > +
 > > 
 > > Doesn't the spec say we need ints off around transitions ?
 > i didn't read it that way.
 > in fact an interrupt is one way to bring the PLL back up after hlt;
 > the timer int is the only one we can conveniently control.
 > 
 > the second write to the MSR doesn't do a PLL transition.

Ok, I'm convinced.


		Dave
