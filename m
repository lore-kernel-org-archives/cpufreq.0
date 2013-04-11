From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] cpufreq: dbx500: Round to closest available freq
Date: Thu, 11 Apr 2013 22:33:07 +0200
Message-ID: <CACRpkdb75wPjXEYdkqE6BOCsuFA_ZBc6GAz1m-5vHWSrSGKyUA@mail.gmail.com>
References: <1365599175-22361-1-git-send-email-ulf.hansson@stericsson.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1365599175-22361-1-git-send-email-ulf.hansson@stericsson.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Ulf Hansson <ulf.hansson@stericsson.com>
Cc: Mats Fagerstrom <mats.fagerstrom@stericsson.com>, Ulf Hansson <ulf.hansson@linaro.org>, cpufreq@vger.kernel.org, Rickard Andersson <rickard.andersson@stericsson.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Apr 10, 2013 at 3:06 PM, Ulf Hansson <ulf.hansson@stericsson.com> wrote:

> From: Mats Fagerstrom <mats.fagerstrom@stericsson.com>
>
> When reading the cpu speed, round it to the closest available
> frequency from the table.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Mats Fagerstrom <mats.fagerstrom@stericsson.com>

(...)
> +       /* The value is rounded to closest frequency in the defined table. */
> +       while (freq_table[i + 1].frequency != CPUFREQ_TABLE_END) {
> +               if (freq < freq_table[i].frequency +
> +                  (freq_table[i + 1].frequency - freq_table[i].frequency) / 2)
>                         return freq_table[i].frequency;

Oh that works, clever.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
