From: Mattia Dongili <malattia@linux.it>
Subject: Re: Centrino based CPU not recognized
Date: Sat, 18 Nov 2006 13:38:27 +0100
Message-ID: <20061118123827.GA3232@inferi.kami.home>
References: <20061118110642.GA10713@feivel.credativ.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061118110642.GA10713@feivel.credativ.de>
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
Content-Transfer-Encoding: 7bit
To: meskes@debian.org
Cc: cpufreq@lists.linux.org.uk

On Sat, Nov 18, 2006 at 12:06:42PM +0100, meskes@debian.org wrote:
> Hi,
> 
> as your driver asked me to send you an email I do. :-)
> 
> Attached you'll find my cpuinfo. You will notice that this is a model 15
> CPU which the driver does not know so far. Since it's a Core2Duo with
> 1.83 GHz it might just be too new. Anyway, I tried to add this CPU so it
> was accepted on the first call to centrino_cpu_init, but it seems this
> function is then called another time (for the other core?) and fails to
> initialize the policy struct in centrino_cpu_init_acpi. At least
> policy->cpu is 1 after the call to this function which causes a ENODEV
> return value. You probably know the reason for this better than I do.
> 
> BTW I'm trying with 2.6.19-rc5.

did you tried both of acpi-cpufreq and speedstep-centrino? I have the
same cpu working here with the former module since 2.6.19-rcX-mm while
it worked with the latter at 2.6.1[78] times.

-- 
mattia
:wq!
