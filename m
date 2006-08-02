From: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Subject: Re: [PATCH 4/8] acpi-cpufreq: remove ACPI from speedstep-centrino
 driver
Date: Wed, 02 Aug 2006 22:39:37 +0400
Message-ID: <44D0F169.10808@linux.intel.com>
References: <44CE5015.2090200@linux.intel.com> <44D0D63E.3070809@goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44D0D63E.3070809@goop.org>
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
To: Jeremy Fitzhardinge <jeremy@goop.org>
Cc: cpufreq@lists.linux.org.uk, Dave Jones <davej@redhat.com>

Jeremy Fitzhardinge wrote:
> Alexey Starikovskiy wrote:
>> speedstep-centrino.c |  270
>> +++++++--------------------------------------------
>> 1 file changed, 40 insertions(+), 230 deletions(-)
>>
>> remove ACPI from speedstep-centrino driver
> Oh, and why, BTW?  Have you replaced it with something else?  A bit more
> of a comment would be nice.
> 
>    J
If you look at the series as a whole you will see, that this functionality is
merged into acpi-cpufreq.
