From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI
	P-statedriver
Date: Tue, 21 Oct 2003 22:01:14 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031021200114.GB26971@brodo.de>
References: <CFF522B18982EA4481D3A3E23B83141C24B4BC@orsmsx407.jf.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <CFF522B18982EA4481D3A3E23B83141C24B4BC@orsmsx407.jf.intel.com>
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
To: "Moore, Robert" <robert.moore@intel.com>
Cc: "Therien, Guy" <guy.therien@intel.com>, "Grover,
	Andrew" <andrew.grover@intel.com>, cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, "Pallipadi,
	Venkatesh" <venkatesh.pallipadi@intel.com>, linux-kernel@vger.kernel.org

On Tue, Oct 21, 2003 at 10:12:14AM -0700, Moore, Robert wrote:
> 
> This is exactly what I was looking at doing, looks like most of the work
> is done.  I have some concerns about the actual algorithm used for
> changing the CPU frequency (20%/80%), but this of course can be tuned.

Well, so write a different governor, and feel free to use Venkatesh's code
as a base [it's GPLed, after all...]. I prefer to have several different 
governors available, so that different users with different needs
can use different "policies".

> I suspect that CPUs that have the capability of changing frequency
> themselves would not use this particular governor.

They can't -- If the driver for Transmeta CPUs is loaded, 
cpufreq governors cannot be started.
 
> You may want to make the sampling rate configurable at run time.

Such a "tweaking by sysfs" patch can be added later.

	Dominik
