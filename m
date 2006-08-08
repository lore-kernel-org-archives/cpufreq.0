From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH 4/8] acpi-cpufreq: remove ACPI from speedstep-centrino
	driver -- updated to not revert Jeremy's patch
Date: Tue, 8 Aug 2006 14:46:51 +0200
Message-ID: <20060808124651.GT17014@poupinou.org>
References: <44CE5015.2090200@linux.intel.com>
	<44D1BBB7.6010903@linux.intel.com>
	<20060808014221.GB21822@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060808014221.GB21822@dominikbrodowski.de>
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
To: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>, "Brown, Len" <len.brown@intel.com>, Dave Jones <davej@redhat.com>, cpufreq@lists.linux.org.uk

Hi,

On Mon, Aug 07, 2006 at 09:42:21PM -0400, Dominik Brodowski wrote:
> Also, I wonder how we'll look on this this merge-all-into-one-driver-approach
> in a few years. Remember Dave's talk at OLS 2003 about
> merge-then-split-up-then-remerging-then-splitting-up-cycles in the
> kernel...[*]

I think the real problem is we don't want to add VIA C7 support to
speedstep-centrino, because the name of the driver might
confuse users.  But it might be possible we have to
support hardcoded tables for VIA C7, due to bad written
AMLs for example.  I really don't know how to resolve in a clean
manner this perticular issue.  Maybe:

1- adding support for the msr stuff to acpi-cpufreq
or
2- rename speedstep-centrino.

With 1 we wont be able to add hardcoded tables for VIA C7 though.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
