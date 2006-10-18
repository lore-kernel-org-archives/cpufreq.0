From: "Hiroshi Miura" <miura@da-cha.org>
Subject: Re: speedstep-smi detection broken.
Date: Wed, 18 Oct 2006 12:59:33 +0900
Message-ID: <a11ccc30610172059q11f8519aw6a72dc9905da8538@mail.gmail.com>
References: <20061017055529.GJ32681@redhat.com>
	<a11ccc30610170700h61c7a9bbgf9f3e74b62fd6c28@mail.gmail.com>
	<20061017180745.GD18353@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20061017180745.GD18353@redhat.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

2006/10/18, Dave Jones <davej@redhat.com>:
> On Tue, Oct 17, 2006 at 11:00:42PM +0900, Hiroshi Miura wrote:
>  > I prefer removing all of P4M case  block  if you remove the printk too.
>  > This means simply not to support P4M with this driver and
>  > return -ENODEV.
>  > If user turn on debug flag, they may see
>  >      dprintk ("No supported Intel CPU detected.\n");
>  > as same as other CPUs.
>
> Yes, even better. I'll apply this.
> Want me to fake a Signed-off-by: from you, as you forgot to add one? :)

Exactly I forgot, sorry.

Hiroshi

Signed-off-by: Hiroshi Miura <miura@da-cha.org>
--- linux-2.6.18/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c~  2006-09-20
12:42:06.000000000 +0900
+++ linux-2.6.18/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c   2006-10-17
22:59:50.553975632 +0900
@@ -360,9 +360,6 @@
       case SPEEDSTEP_PROCESSOR_PIII_C:
       case SPEEDSTEP_PROCESSOR_PIII_C_EARLY:
               break;
-       case SPEEDSTEP_PROCESSOR_P4M:
-               printk(KERN_INFO "speedstep-smi: you're trying to use
this cpufreq driver on a Pentium 4-based CPU. Most likely it will not
work.\n");
-               break;
       default:
               speedstep_processor = 0;
       }

-- 
HIroshi Miura
