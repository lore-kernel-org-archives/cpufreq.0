From: Andreas Herrmann <andreas.herrmann3@amd.com>
Subject: Re: [PATCH 1/5] acpi-cpufreq: Add support for modern AMD CPUs
Date: Thu, 19 May 2011 09:26:46 +0200
Message-ID: <20110519072646.GB19481@alberich.amd.com>
References: <1305651819-25660-1-git-send-email-mjg@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1305651819-25660-1-git-send-email-mjg@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: Matthew Garrett <mjg@redhat.com>
Cc: linux-kernel@vger.kernel.org, borislav.petkov@amd.com, davej@redhat.com, mark.langsdorf@amd.com, cpufreq@vger.kernel.org

On Tue, May 17, 2011 at 01:03:35PM -0400, Matthew Garrett wrote:
> The programming model for P-states on modern AMD CPUs is very similar to
> that of Intel and VIA. It makes sense to consolidate this support into one
> driver rather than duplicating functionality between two of them. This
> patch adds support for AMDs with hardware P-state control to acpi-cpufreq.

I think it's a good idea to move the stuff into the more general
driver.  (And this way powernow-k8 becomes what it is supposed to be
-- relevant for K8 CPUs only.)  From a first glance most stuff looks
fine. (but detailed review and testing still outstanding.)

> Signed-off-by: Matthew Garrett <mjg@redhat.com>
> ---
>  arch/x86/include/asm/cpufeature.h          |    1 +
>  arch/x86/include/asm/msr-index.h           |    2 +
>  arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c |   43 ++++++++++++++++++++++++----
>  arch/x86/kernel/cpu/scattered.c            |    1 +
>  4 files changed, 41 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
> index 91f3e087..fee7089 100644
> --- a/arch/x86/include/asm/cpufeature.h
> +++ b/arch/x86/include/asm/cpufeature.h
> @@ -174,6 +174,7 @@
>  #define X86_FEATURE_PLN		(7*32+ 5) /* Intel Power Limit Notification */
>  #define X86_FEATURE_PTS		(7*32+ 6) /* Intel Package Thermal Status */
>  #define X86_FEATURE_DTS		(7*32+ 7) /* Digital Thermal Sensor */
> +#define X86_FEATURE_POWERNOW	(7*32+ 8) /* AMD frequency scaling */

I think it shouldn't be named like that. I'd rather call it
HW_PSTATE. The more general term POWERNOW is also associated with the
old FID/VID control method of changing frequencies on AMD CPUs.  Also
AMD documentation refers to this feature as HwPstate.


Regards,

Andreas


