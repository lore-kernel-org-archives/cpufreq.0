From: Jarod Wilson <jwilson@redhat.com>
Subject: Re: Unknown p4-clockmode capable CPU
Date: Mon, 25 Feb 2008 09:02:01 -0500
Message-ID: <200802250902.01276.jwilson@redhat.com>
References: <47C25A7C.3020305@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <47C25A7C.3020305@gmail.com>
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
To: cpufreq@lists.linux.org.uk
Cc: Emmanuel Andreu <emmanuel.andreu@gmail.com>

On Monday 25 February 2008 01:04:44 am Emmanuel Andreu wrote:
> Hello,
>
> Cpufreqd tells me at syslog :
> Feb 24 22:57:23 underworld kernel: [  247.512000] p4-clockmod: Unknown
> p4-clockmod-capable CPU. Please send an e-mail to
> <cpufreq@lists.linux.org.uk>.
> My CPU is a Celeron M 530, that works "fine" (a little bit slowly !!) on
> Vista, but that doesn't get recognized yet, neither by p4-clockmod, nor
> by all the lm-sensors stuff. Laptops running this CPU (most "low cost
> long battery-life" recent laptops, in my case the Lenovn 3000 N200
> 0769-A42) will have to run with full speed CPU and sometimes overheat
> problems, for now).
>
> Hope my little report will help, best regards,

Something that new hopefully works with acpi-cpufreq instead of the ancient 
and crappy p4-clockmod. Have you tried acpi-cpufreq instead?

-- 
Jarod Wilson
jwilson@redhat.com
