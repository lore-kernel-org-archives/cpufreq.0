From: Rudolf Lohner <Rudolf.Lohner@rz.uni-karlsruhe.de>
Subject: Re: Can't get it working on Mobile Coppermine 1Ghz - i440BX -
	please help...
Date: Thu, 14 Sep 2006 00:48:49 +0200
Message-ID: <200609140048.53984.Rudolf.Lohner@rz.uni-karlsruhe.de>
References: <20060913103738.9984.qmail@web30803.mail.mud.yahoo.com>
	<20060913170121.GJ4945@poupinou.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20060913170121.GJ4945@poupinou.org>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk
Cc: Bruno Ducrot <ducrot@poupinou.org>

Same problem for me:
I have a 700MHz Mobile Coppermine on i440BX

> > http://forums.gentoo.org/viewtopic-t-497427.html
my /proc/cpuinfo differs only in:
stepping      : 6
cpu MHz       : 697.028
bogomips      : 1395.44

I'm running Debian sid with kernel 2.6.17. Here is uname -a :
Linux rzm-lohner-lt 2.6.17-2-686 #1 SMP Thu Aug 31 12:53:18 UTC 2006 i686 GNU/Linux

Everything necessery for speedstep should be enabled in the
kernel config in my opinion.

> > If you have a clue of where I could begin to continue
> > to search, please post it...
> > 
> 
> http://www.poupinou.org/cpufreq/
> 
> Perhaps doing something like that:
> 
> modprobe speedstep-smi smi_port=0xb2 smi_cmd=0x82 smi_sig=1
> will help resolve that issue?

trying: modprobe speedstep-smi smi_port=0xb2 smi_cmd=0x82 smi_sig=1
gives:
FATAL: Error inserting speedstep_smi (/lib/modules/2.6.17-2-686/kernel/arch/i386/kernel/cpu/cpufreq/speedstep-smi.ko): No such device

> 
> If that don't work, please provide output from speedstep-detect
> that can be found here:
> ftp://ftp.poupinou.org/cpufreq/speedstep-detect.tar.gz

I'll send the output of speedstep-detect to Bruno in a second...

Rudolf 

-- 
Rudolf Lohner  -  Universitaet Karlsruhe (TH)
Rechenzentrum,  Zirkel 2,   D-76128 Karlsruhe
Phone: +49-721-608-6958,   Fax: +49-721-32550
E-Mail:     Rudolf.Lohner@rz.uni-karlsruhe.de
http://www.rz.uni-karlsruhe.de/~Rudolf.Lohner
