From: Bruno Ducrot <ducrot@poupinou.org>
Subject: [ducrot@poupinou.org: Re: CPU Frequency daemon: no cpufreq
	interface found.]
Date: Fri, 6 May 2005 14:41:59 +0200
Message-ID: <20050506124159.GF21800@poupinou.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Forgot to CC to cpufreq ML, sorry.

----- Forwarded message from Bruno Ducrot <ducrot@poupinou.org> -----

Envelope-to: ducrot@poupinou.org
To: Fredrik Eriksson <fredrik.eriksson@mudsphere.net>
Subject: Re: CPU Frequency daemon: no cpufreq interface found.
From: Bruno Ducrot <ducrot@poupinou.org>

On Fri, May 06, 2005 at 02:03:15PM +0200, Fredrik Eriksson wrote:
> On Friday 06 May 2005 10:09, you wrote:
> > On Fri, May 06, 2005 at 12:19:04AM +0200, Fredrik Eriksson wrote:
> > > having problems with my Armada M700 pIII 800mhz laptop.
> > > Ive tired pretty much everything... ive compiled every support for
> > > speedstepping into the kernel and it still doesnt show any interfaces.
> > > the sysfs doesnt show and devices in /sys/devices/system/cpu/cpu0/
> > >
> > > and i cant see any evidence in my dmesg that CPU scaling is loaded
> > >
> > > Anyone tried running speedstep on a Armada M700 that might be able to
> > > help?
> > >
> > > here's a "dmesg > dmesg.txt" if that will help you find my problem
> > > http://www.snuttefilt.org/~sajko/dmesg.txt
> >
> > Could you try to build speedstep-smi as a module and do something like
> > this:
> >
> > modprobe speedstep-smi smi_port=0xb2 smi_cmd=0x82 smi_sig=1
> >
> > Please do it with debug things as pointed by Dominik.
> >
> > Cheers,
> 
> okey... this was wierd :P i tried to load the module when i got back into X. 
> and then it said no device found... then i tried like 2 minutes later (cause 
> i was gonna copy/paste what it said here) and then it off some unknown reason 
> worked... so i guess i dont have to do anything more... it still says no 
> cpufreq interface when i boot. but i can live with having to load the module 
> when i need to use speedstep, thx for the help thou guys :)

You can try a boot kernel parameter instead.  It should be something
like this (not tested):
speedstep_smi.smi_port=0xb2 speedstep_smi.smi_cmd=0x82 speedstep_smi.smi_sig=1

this should work only if speedstep-smi is compiled in-kernel (not as a
module).

It is just more easy to check if parameters work with modules you know ;)

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

----- End forwarded message -----

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
