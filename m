From: Tony Lindgren <tony@atomide.com>
Subject: Re: [tony@atomide.com: [PATCH] Powernow-k8 buggy BIOS override for
	2.6.6]
Date: Thu, 13 May 2004 08:34:01 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040513153401.GB8480@atomide.com>
References: <20040513001628.GA9388@atomide.com>
	<20040513140501.GG16687@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040513140501.GG16687@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, pavel@ucw.cz
Cc: cpufreq@www.linux.org.uk

* Dave Jones <davej@redhat.com> [040513 07:06]:
> On Wed, May 12, 2004 at 05:16:28PM -0700, Tony Lindgren wrote:
> 
>  > Following is the updated patch to make the powernow-k8 driver work on 
>  > machines with buggy BIOS, such as emachines m6805.
>  > 
>  > The patch overrides the PST table only if check_pst_table() fails.
>  > 
>  > The minimum value for the override is 800MHz, which is the lowest value 
>  > on all x86_64 systems AFAIK. The max value is the current running value.
>  > 
>  > This patch should be safe to apply, even if Pavel's ACPI table check is
>  > added to the driver. Or does anybody see a problem with it?
> 
> Does the ACPI fallback not do the right thing ?

Does not work for me. But looks like that's because I had to turn off 
ACPI processor module since 2.6.6 since it would hang my system. It could 
also be that the hang is caused by the powernow-k8. I will check that.

> I don't really see the point of limping along with a 2-state PST
> if we can derive the proper info from the ACPI table.

Sure if the ACPI table check works properly. But even with 2-state PST,
being able to change from 1800MHz to 800MHz on battery increases the 
battery life quite a bit. And it does not necessarily require ACPI :)

Regards,

Tony
