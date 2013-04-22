From: Taras Kondratiuk <taras@ti.com>
Subject: Re: [RFC PATCH 1/2] regulator: core: Add regulator_set_voltage_min()
Date: Mon, 22 Apr 2013 19:49:37 +0300
Message-ID: <51756A21.3020405@ti.com>
References: <1366372554-20866-1-git-send-email-taras@ti.com> <1366372554-20866-2-git-send-email-taras@ti.com> <20130422131904.GL30351@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <20130422131904.GL30351@opensource.wolfsonmicro.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, rjw@sisk.pl, viresh.kumar@linaro.org, shawn.guo@linaro.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Philip Rakity <prakity@nvidia.com>, Eric Miao <eric.y.miao@gmail.com>

On 04/22/2013 04:19 PM, Mark Brown wrote:
> On Fri, Apr 19, 2013 at 02:55:53PM +0300, Taras Kondratiuk wrote:
>> Sometimes it is a need to constrain only a minimum voltage
>> and let system constraints to limit maximum.
>> Add a new function regulator_set_voltage_min() for this.
> I don't believe you on this one.  It is going to be a very unusual
> system which has a maximum supply voltage specified at over 4kV (or
> more) which is what INT_MAX will come out as - there will be some
> electrical specs for what voltages can be tolerated sustainably.
Yeah. Sure 4kV is not a real request, but
max will be limited by system constrains.
According to regulator_set_voltage() documentation
system constraints should be set before calling this function,
so I assume I can rely on them. No?

Another possible implementation is below, but prefer initial one.

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index e3661c2..28c1be3 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2355,6 +2355,19 @@ out2:
  }
  EXPORT_SYMBOL_GPL(regulator_set_voltage);

+int regulator_set_voltage_min(struct regulator *regulator, int min_uV)
+{
+       struct regulator_dev *rdev = regulator->rdev;
+       int max_uV;
+
+       mutex_lock(&rdev->mutex);
+       max_uV = rdev->constraints->max_uV;
+       mutex_unlock(&rdev->mutex);
+       return regulator_set_voltage(regulator, min_uV, max_uV);
+}
+EXPORT_SYMBOL_GPL(regulator_set_voltage_min);
+
+
  /**
   * regulator_set_voltage_time - get raise/fall time
   * @regulator: regulator source


-- 
BR
Taras Kondratiuk | GlobalLogic

