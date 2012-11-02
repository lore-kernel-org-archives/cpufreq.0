From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH 0/6 v2] cpufreq: add support for Calxeda ECX-1000 (highbank)
Date: Fri, 02 Nov 2012 22:45:36 +0100
Message-ID: <1835379.6Ci8lTl9hk@vostro.rjw.lan>
References: <1351631056-25938-1-git-send-email-mark.langsdorf@calxeda.com> <1351882309-733-1-git-send-email-mark.langsdorf@calxeda.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1351882309-733-1-git-send-email-mark.langsdorf@calxeda.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Langsdorf <mark.langsdorf@calxeda.com>
Cc: linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org

Hi,

On Friday, November 02, 2012 01:51:43 PM Mark Langsdorf wrote:
> This patch series adds cpufreq support for the Calxeda ECX-1000 (highbank)
> SoCs. The driver is based on the cpufreq-cpu0 driver. Because of the 
> unique way that highbank uses the EnergyCore Management Engine to manage
> voltages, it was not possible to use the cpufreq-cpu0 driver.

Can you please resend the whole series with CCs to linux-pm@vger.kernel.org,
so that the patches are accessible to me through Patchwork?

Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
