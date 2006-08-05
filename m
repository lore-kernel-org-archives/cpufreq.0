From: Mattia Dongili <malattia@linux.it>
Subject: Re: Dell bios + cpufreqd problem
Date: Sat, 5 Aug 2006 13:52:08 +0200
Message-ID: <20060805115208.GB4060@inferi.kami.home>
References: <e29f4c3f0608030232n695737f6yd249b24f059f5c6e@mail.gmail.com>
	<1154606992.4302.496.camel@queen.suse.de>
	<e29f4c3f0608040845y10f38c01lda01eaeb9c0edb14@mail.gmail.com>
	<8355938.1154725804784.SLOX.WebMail.wwwrun@imap-dhs.suse.de>
	<20060805082832.GA4060@inferi.kami.home>
	<e29f4c3f0608050357x1f536e82s1f98696b8a16c84f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <e29f4c3f0608050357x1f536e82s1f98696b8a16c84f@mail.gmail.com>
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
To: Stijn Van Nieuwenhuyse <stivani@gmail.com>
Cc: cpufreq@lists.linux.org.uk

On Sat, Aug 05, 2006 at 12:57:33PM +0200, Stijn Van Nieuwenhuyse wrote:
> I get this in the logs, while using cpufreqd 2.1.1 and the example
> cpufreqd.conf which can be found on the cpufreqd website:
> 
> Aug  5 12:51:50 asterix cpufreqd: cpufreqd_set_profile     : I haven't
> been able to set the chosen policy for CPU0. I set
> 1700000-600000-ondemand System says 600000-600000-ondemand
> Aug  5 12:51:55 asterix logger: ACPI group battery / action battery is
> not defined
> Aug  5 12:51:55 asterix logger: ACPI group battery / action battery is
> not defined
> Aug  5 12:52:06 asterix logger: ACPI group processor / action
> processor is not defined
> Aug  5 12:52:40 asterix cpufreqd: cpufreqd_set_profile     : I haven't
> been able to set the chosen policy for CPU0. I set
> 1700000-1700000-performance System says 1700000-600000-performance
> Aug  5 12:52:40 asterix logger: ACPI group ac_adapter / action
> ac_adapter is not defined
> Aug  5 12:52:40 asterix logger: ACPI group battery / action battery is
> not defined
> Aug  5 12:52:47 asterix logger: ACPI group battery / action battery is
> not defined
> Aug  5 12:52:47 asterix logger: ACPI group battery / action battery is
> not defined

It seems to be as Thomas diagnosed.
Out of curiosity, which cpufrequtils version do you have? see
cpufreq-info full output, if you don't have version 002, please upgrade
it and retry.

Anyway I'll try to fix the 15secs delay in cpufreqd 2.2.0, the failure
to se a new policy should be better handled.
Stijin, could you try out some patches I'd forward you privately later?

Thanks
-- 
mattia
:wq!
