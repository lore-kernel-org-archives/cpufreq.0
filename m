From: Josh Triplett <josh@joshtriplett.org>
Subject: Re: [PATCH v2] drivers: cpufreq: Mark function as static in cpufreq.c
Date: Wed, 26 Feb 2014 08:41:42 -0800
Message-ID: <20140226164142.GA18079@thin>
References: <linux-pm@vger.kernel.org20140226154625.GA10701@rashika>
 <1393432706-25708-1-git-send-email-rashika.kheria@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1393432706-25708-1-git-send-email-rashika.kheria@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rashika Kheria <rashika.kheria@gmail.com>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, cpufreq@vger.kernel.org

On Wed, Feb 26, 2014 at 10:08:26PM +0530, Rashika Kheria wrote:
> Mark function as static in cpufreq.c because it is not
> used outside this file.
>=20
> This eliminates the following warning in cpufreq.c:
> drivers/cpufreq/cpufreq.c:355:9: warning: no previous prototype for =E2=
=80=98show_boost=E2=80=99 [-Wmissing-prototypes]
>=20
> Signed-off-by: Rashika Kheria <rashika.kheria@gmail.com>

I don't see any uses of this function in cpufreq.c; have uses appeared
in a development branch?

>  drivers/cpufreq/cpufreq.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 08ca8c9..54fd670 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -352,7 +352,7 @@ EXPORT_SYMBOL_GPL(cpufreq_notify_post_transition)=
;
>  /*******************************************************************=
**
>   *                          SYSFS INTERFACE                         =
 *
>   *******************************************************************=
**/
> -ssize_t show_boost(struct kobject *kobj,
> +static ssize_t show_boost(struct kobject *kobj,
>  				 struct attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "%d\n", cpufreq_driver->boost_enabled);
> --=20
> 1.7.9.5
>=20
