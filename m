From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] speedstep-centrino should ignore upper performance
	control bits
Date: Mon, 6 Nov 2006 21:14:41 -0500
Message-ID: <20061107021441.GA10457@isilmar.linta.de>
References: <20061106233923.GA15063@us.ibm.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20061106233923.GA15063@us.ibm.com>
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
To: Gary Hade <garyhade@us.ibm.com>
Cc: cpufreq@lists.linux.org.uk, davej@redhat.com

On Mon, Nov 06, 2006 at 03:39:23PM -0800, Gary Hade wrote:
> 
> On some systems such as the IBM x3650 there are bits set in the 
> upper half of the control values provided by the _PSS object.  
> These bits are only relevant for cpufreq drivers that use IO ports 
> which are not currently supported by the speedstep-centrino driver.  
... and probably never will.

> The current MSR oriented code assumes that upper bits are not set 
> and thus fails to work correctly when they are.  e.g. the control 
> and status value equality check fails even though the ACPI spec 
> allows the inequality.
How does the acpi-cpufreq driver work with it?

Thanks,
	Dominik
