From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH V3 1/2] cpufreq: ondemand: allow custom
 powersave_bias_target handler to be registered
Date: Wed, 3 Apr 2013 10:42:51 +0530
Message-ID: <CAKohpomQN2endmNtvVS3JrqqPbyQpaZuVbiJ_hpM5SFLfDNRww@mail.gmail.com>
References: <1364926304-1799-1-git-send-email-jacob.shin@amd.com>
	<1364926304-1799-2-git-send-email-jacob.shin@amd.com>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1364926304-1799-2-git-send-email-jacob.shin@amd.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacob Shin <jacob.shin@amd.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Renninger <trenn@suse.de>, Borislav Petkov <bp@alien8.de>

On 2 April 2013 23:41, Jacob Shin <jacob.shin@amd.com> wrote:
> This allows for another [arch specific] driver to hook into existing
> powersave bias function of the ondemand governor. i.e. This allows AMD
> specific powersave bias function (in a separate AMD specific driver)
> to aid ondemand governor's frequency transition deicisions.
>
> Signed-off-by: Jacob Shin <jacob.shin@amd.com>
> ---
>  drivers/cpufreq/cpufreq_governor.h |    3 +++
>  drivers/cpufreq/cpufreq_ondemand.c |   32 ++++++++++++++++++++++++--------
>  2 files changed, 27 insertions(+), 8 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
