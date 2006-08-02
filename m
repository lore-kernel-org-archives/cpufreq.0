From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: [PATCH 4/8] acpi-cpufreq: remove ACPI from speedstep-centrino
 driver
Date: Wed, 02 Aug 2006 09:43:42 -0700
Message-ID: <44D0D63E.3070809@goop.org>
References: <44CE5015.2090200@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44CE5015.2090200@linux.intel.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Cc: cpufreq@lists.linux.org.uk, Dave Jones <davej@redhat.com>

Alexey Starikovskiy wrote:
> speedstep-centrino.c |  270 
> +++++++--------------------------------------------
> 1 file changed, 40 insertions(+), 230 deletions(-)
>
> remove ACPI from speedstep-centrino driver
Oh, and why, BTW?  Have you replaced it with something else?  A bit more 
of a comment would be nice.

    J
