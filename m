From: Clemens Orthacker <clemenso@sbox.tugraz.at>
Subject: Re: kernel: acpi-cpufreq: Transition failed
Date: Sun, 6 Feb 2005 20:34:16 +0100
Message-ID: <200502062034.16595.clemenso@sbox.tugraz.at>
References: <200502021158.26890.clemenso@sbox.tugraz.at>
	<200502050925.11480.clemenso@sbox.tugraz.at>
	<20050205105359.GA7917@dominikbrodowski.de>
Reply-To: clemenso@sbox.tugraz.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050205105359.GA7917@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.de>
Cc: cpufreq@lists.linux.org.uk

Am Samstag, 5. Februar 2005 11:53 schrieben Sie:

> Could you remove the line in arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.c
> which states:
>         acpi_processor_notify_smm(THIS_MODULE);
> recompile, re-install, and re-test, please?
>

Gives the same result as before. (3 error messages, 22 min uptime)

ps. While recompiling the kernel the frequency was changing to max without 
problems. Probably there is some problem with powernowd. Can you recommand 
any other userspace tool?
Will there be a cpufrequtils debian package?

Thanks 


-- 
| Clemens Orthacker
| e-mail: ClemensO@sbox.TUGraz.at
| phone: +43/650/6693393
