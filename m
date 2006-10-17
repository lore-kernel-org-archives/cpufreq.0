From: "Hiroshi Miura" <miura@da-cha.org>
Subject: Re: speedstep-smi detection broken.
Date: Tue, 17 Oct 2006 23:00:42 +0900
Message-ID: <a11ccc30610170700h61c7a9bbgf9f3e74b62fd6c28@mail.gmail.com>
References: <20061017055529.GJ32681@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20061017055529.GJ32681@redhat.com>
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

I prefer removing all of P4M case  block  if you remove the printk too.
This means simply not to support P4M with this driver and
return -ENODEV.
If user turn on debug flag, they may see
	dprintk ("No supported Intel CPU detected.\n");
as same as other CPUs.

Hiroshi

--- linux-2.6.18/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c~	2006-09-20
12:42:06.000000000 +0900
+++ linux-2.6.18/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c	2006-10-17
22:59:50.553975632 +0900
@@ -360,9 +360,6 @@
 	case SPEEDSTEP_PROCESSOR_PIII_C:
 	case SPEEDSTEP_PROCESSOR_PIII_C_EARLY:
 		break;
-	case SPEEDSTEP_PROCESSOR_P4M:
-		printk(KERN_INFO "speedstep-smi: you're trying to use this cpufreq
driver on a Pentium 4-based CPU. Most likely it will not work.\n");
-		break;
 	default:
 		speedstep_processor = 0;
 	}

2006/10/17, Dave Jones <davej@redhat.com>:
> If someone inserts speedstep-smi on a mobile P4,
> it prevents other cpufreq modules from loading until it
> is unloaded.
>
> Opinions on this patch ?
> (I'm tempted to just remove the printk too).
>
>         Dave
>
> --- local-git/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c~     2006-10-17 01:53:29.000000000 -0400
> +++ local-git/arch/i386/kernel/cpu/cpufreq/speedstep-smi.c      2006-10-17 01:54:02.000000000 -0400
> @@ -362,7 +362,7 @@ static int __init speedstep_init(void)
>                 break;
>         case SPEEDSTEP_PROCESSOR_P4M:
>                 printk(KERN_INFO "speedstep-smi: you're trying to use this cpufreq driver on a Pentium 4-based CPU. Most likely it will not work.\n");
> -               break;
> +               return -ENODEV;
>         default:
>                 speedstep_processor = 0;
>         }
>
>
> --
> http://www.codemonkey.org.uk
>


-- 
HIroshi Miura
