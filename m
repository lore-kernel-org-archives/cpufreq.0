From: Pavel Machek <pavel@ucw.cz>
Subject: Re: Cleanups for powernow-k8
Date: Wed, 14 Jan 2004 00:59:39 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040113235938.GA25158@elf.ucw.cz>
References: <20040113215149.GA236@elf.ucw.cz>
	<20040113215918.GK14674@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040113215918.GK14674@redhat.com>
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
To: Dave Jones <davej@redhat.com>, Pavel Machek <pavel@ucw.cz>, cpufreq@www.linux.org.uk, linux@brodo.de, kernel list <linux-kernel@vger.kernel.org>, paul.devriendt@amd.com

Hi!

>  > and is way too verbose.
> 
> I agree that something like that output belongs more in x86info,
> or a standalone tool, but I think Paul wanted to keep debugging stuff
> there for the time being. Maybe silence it, and have it enabled
> with a 'debug' module param ? Paul ?

I made sure all the info is still there in dmesg, just on less lines.

>  > @@ -637,6 +629,7 @@
>  >  		}
>  >  
>  >  		if ((numps <= 1) || (batps <= 1)) {
>  > +			/* FIXME: Is this right? I can see one state on battery, two states total as an usefull config */
>  >  			printk(KERN_ERR PFX "only 1 p-state to transition\n");
>  >  			return -ENODEV;
>  >  		}
>  > the test probably should be numps <= 1 only, but it does not matter as
>  > we force numps = batps]
> 
> 1 state on battery sounds odd. Buggy BIOS ?

No if you have 1 state on battery but two on AC power. That way you
*have* to be low power on battery, but can select low or high on
AC... Ugly hardware, but Intel done this before, and it kind-of makes
sense.
								Pavel

-- 
When do you have heart between your knees?
