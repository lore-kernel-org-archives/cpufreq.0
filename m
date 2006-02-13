From: Andi Kleen <ak@suse.de>
Subject: Re: 2.6.16-rc2, x86-64, CPU hotplug failure
Date: Mon, 13 Feb 2006 10:18:06 +0100
Message-ID: <200602131018.06549.ak@suse.de>
References: <200602130230.41120.s0348365@sms.ed.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <200602130230.41120.s0348365@sms.ed.ac.uk>
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
To: Alistair John Strachan <s0348365@sms.ed.ac.uk>
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org

On Monday 13 February 2006 03:30, Alistair John Strachan wrote:
> Hi,
> 
> In an attempt to play with ACPI S3 on my Athlon 64 X2 3800+, I recompiled 
> 2.6.16-rc2 with CPU hotplug and ACPI sleep state support. I experienced 
> multiple crashes and oopsen, which I quickly discovered were the result of 
> bringing at least one CPU back online.

Yes, known problem. They seem to be related to the powernow driver. Does
it work if you don't compile CPUFREQ in?

-Andi
