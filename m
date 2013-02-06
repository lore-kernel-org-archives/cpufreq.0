From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: [PATCH 2/7] cpufreq: Retrieve current frequency from scaling
 drivers with internal governors
Date: Tue, 05 Feb 2013 18:15:54 -0800
Message-ID: <5111BCDA.1060507@gmail.com>
References: <1360088646-19104-1-git-send-email-dirk.brandewie@gmail.com> <1360088646-19104-3-git-send-email-dirk.brandewie@gmail.com> <CAOh2x=nYOf32jKqwwikgBS2oRHwmhZdVug=pLzQZWp-N2S9CGw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=my0JotI0z3xmFS21umyt7UwExJLJgzeqZP0OPyaw6KU=;
        b=M0WFCV/3b4fJ++PVwmUZxgdCzPeyVysbYcybXElMXiNKFkFC1A5JBLI6btAy5Ug68Z
         74OkDMNybsVsmH5FXEAmI59N6zfoTPME1hrZQ3Nj/DOVASQX5ck4X0gSsXgTVwxP2Dro
         bcM3p0FXZrkLElBhhruOxZV8pVNegduzZQBx7ApA+9r/ddnMIh0S/AjCB0UM4oKVVXeU
         haLBlOCOOJnvqIktkxB2V8uO1TRnK+/pwrzPmCCJQ5tuHL5hoxzsGJ6SvjGyIPXwNDRD
         SCIG+bidpw+W12E+JXsIj0pzDzom/3FrxjACnijQOnxijF33WZ4FCGPbWdBWQAqxbaml
         kMuA==
In-Reply-To: <CAOh2x=nYOf32jKqwwikgBS2oRHwmhZdVug=pLzQZWp-N2S9CGw@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: dirk.brandewie@gmail.com, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Dirk Brandewie <dirk.j.brandewie@intel.com>

On 02/05/2013 05:45 PM, Viresh Kumar wrote:
> On Tue, Feb 5, 2013 at 11:54 PM,  <dirk.brandewie@gmail.com> wrote:
>> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
>> index 2817c3c..96bc302 100644
>> --- a/drivers/cpufreq/cpufreq.c
>> +++ b/drivers/cpufreq/cpufreq.c
>> @@ -1181,6 +1181,13 @@ unsigned int cpufreq_quick_get(unsigned int cpu)
>>          struct cpufreq_policy *policy = cpufreq_cpu_get(cpu);
>>          unsigned int ret_freq = 0;
>>
>> +       if (cpufreq_driver && cpufreq_driver->setpolicy &&
>> +               cpufreq_driver->get) {
>> +               ret_freq = cpufreq_driver->get(cpu);
>> +               cpufreq_cpu_put(policy);
>> +               return ret_freq;
>> +       }
>> +
>
How about this?

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 2817c3c..9c0eac4 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -1182,7 +1182,12 @@ unsigned int cpufreq_quick_get(unsigned int cpu)
  	unsigned int ret_freq = 0;

  	if (policy) {
-		ret_freq = policy->cur;
+		if (cpufreq_driver && cpufreq_driver->setpolicy &&
+			cpufreq_driver->get) {
+			ret_freq = cpufreq_driver->get(cpu);
+		} else {
+			ret_freq = policy->cur;
+		}
  		cpufreq_cpu_put(policy);
  	}


