From: Dave Jones <davej@redhat.com>
Subject: Re: Cleanups for powernow-k8
Date: Tue, 13 Jan 2004 21:59:18 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040113215918.GK14674@redhat.com>
References: <20040113215149.GA236@elf.ucw.cz>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040113215149.GA236@elf.ucw.cz>
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
To: Pavel Machek <pavel@ucw.cz>
Cc: kernel list <linux-kernel@vger.kernel.org>, paul.devriendt@amd.com, cpufreq@www.linux.org.uk, linux@brodo.de

On Tue, Jan 13, 2004 at 10:51:49PM +0100, Pavel Machek wrote:

 > powernow-k8 uses strange kind of comments

comments part I kinda agree with, though its not critical..

 > and is way too verbose.

I agree that something like that output belongs more in x86info,
or a standalone tool, but I think Paul wanted to keep debugging stuff
there for the time being. Maybe silence it, and have it enabled
with a 'debug' module param ? Paul ?
 
 > Also powernow-k7 should just shut up when it is monolithic
 > kernel and cpu is not k7.

Agreed, applied.

 > @@ -637,6 +629,7 @@
 >  		}
 >  
 >  		if ((numps <= 1) || (batps <= 1)) {
 > +			/* FIXME: Is this right? I can see one state on battery, two states total as an usefull config */
 >  			printk(KERN_ERR PFX "only 1 p-state to transition\n");
 >  			return -ENODEV;
 >  		}
 > the test probably should be numps <= 1 only, but it does not matter as
 > we force numps = batps]

1 state on battery sounds odd. Buggy BIOS ?

		Dave
