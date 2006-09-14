From: Johny the Ripper <my_publicyty@yahoo.com>
Subject: Re: Can't get it working on Mobile Coppermine 1Ghz - i440BX -
	please help...
Date: Thu, 14 Sep 2006 05:28:03 -0700 (PDT)
Message-ID: <20060914122803.72390.qmail@web30805.mail.mud.yahoo.com>
References: <200609140048.53984.Rudolf.Lohner@rz.uni-karlsruhe.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <200609140048.53984.Rudolf.Lohner@rz.uni-karlsruhe.de>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk
Cc: Bruno Ducrot <ducrot@poupinou.org>

Hi,


Thank you Bruno, with the module params you specified
I have it running now :)
However, it still doesn't do everything I wanted, but
I suspect this has to do with hardware limitations...
My goal was to use the "ondemand" governor, but I
cannot start it. I can set the frequency manually and
load the powersave, performance and userspace
governors -- but not the ondemand governor :( Is this
normal?

For Rudolf: I have seen this error too. With me it
occurs when you have set the speedstep setting in your
bios to "disabled". I have 4 options in my bios for
speedstep (max performance, battery optimized, auto
and disabled) and selected "auto". The module should
then load fine.


greetz,
Johny

--- Rudolf Lohner <Rudolf.Lohner@rz.uni-karlsruhe.de>
wrote:

> Same problem for me:
> I have a 700MHz Mobile Coppermine on i440BX
> 
> > > http://forums.gentoo.org/viewtopic-t-497427.html
> my /proc/cpuinfo differs only in:
> stepping      : 6
> cpu MHz       : 697.028
> bogomips      : 1395.44
> 
> I'm running Debian sid with kernel 2.6.17. Here is
> uname -a :
> Linux rzm-lohner-lt 2.6.17-2-686 #1 SMP Thu Aug 31
> 12:53:18 UTC 2006 i686 GNU/Linux
> 
> Everything necessery for speedstep should be enabled
> in the
> kernel config in my opinion.
> 
> > > If you have a clue of where I could begin to
> continue
> > > to search, please post it...
> > > 
> > 
> > http://www.poupinou.org/cpufreq/
> > 
> > Perhaps doing something like that:
> > 
> > modprobe speedstep-smi smi_port=0xb2 smi_cmd=0x82
> smi_sig=1
> > will help resolve that issue?
> 
> trying: modprobe speedstep-smi smi_port=0xb2
> smi_cmd=0x82 smi_sig=1
> gives:
> FATAL: Error inserting speedstep_smi
>
(/lib/modules/2.6.17-2-686/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.ko):
> No such device
> 
> > 
> > If that don't work, please provide output from
> speedstep-detect
> > that can be found here:
> >
>
ftp://ftp.poupinou.org/cpufreq/speedstep-detect.tar.gz
> 
> I'll send the output of speedstep-detect to Bruno in
> a second...
> 
> Rudolf 
> 
> -- 
> Rudolf Lohner  -  Universitaet Karlsruhe (TH)
> Rechenzentrum,  Zirkel 2,   D-76128 Karlsruhe
> Phone: +49-721-608-6958,   Fax: +49-721-32550
> E-Mail:     Rudolf.Lohner@rz.uni-karlsruhe.de
> http://www.rz.uni-karlsruhe.de/~Rudolf.Lohner
> 


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
