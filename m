From: Dirk Brandewie <dirk.brandewie@gmail.com>
Subject: Re: Questions on the PID controller in the intel_pstate driver
Date: Tue, 20 Aug 2013 10:53:15 -0700
Message-ID: <5213AD0B.9060805@intel.com>
References: <CAN_LGv2EpaX+-gNpzSFw2Q1-ZS+R2rwt5SYVeHVGfRG+M4a+0g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=c3LrXElupR6DF/11394O1oQgEYMFT+8uwtJhE4yQoNM=;
        b=H3G2zlViuX4P44ZvZz4jJJJv2mVUzhgDghLljR/Le/GyvuLuVJn3m9wh3VzIzzofvY
         yKhmYsu8M8zE5LCCOWcC+GFuLL/Ul3zZp9jlWIxbroVf7Ykb6enTbRCGvQ50JSLSreaR
         FrlQR7FGZKWnH7NOrq+V3nrWH98XL5p3tKxEHt2rYF3AbT6Mxf5bUYvK2iWooTuNx/3Z
         AVnaOvUzaZpc3lHRBglyGCibvMTweHP2tEJV9FaQtYNt0/hKk+Fs/7A5VqpDBlwXjxFm
         7LlYF9AzzWCFbHTTFLG0OZjh0eUojaqs2U6Il7OPPWhzrJGCU4JK09lSNAmZKccPmMhn
         31KQ==
In-Reply-To: <CAN_LGv2EpaX+-gNpzSFw2Q1-ZS+R2rwt5SYVeHVGfRG+M4a+0g@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Alexander E. Patrakov" <patrakov@gmail.com>
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>, cpufreq@vger.kernel.org

On 08/11/2013 06:04 AM, Alexander E. Patrakov wrote:
> Hello.
>
> I have noticed that there is a PID controller in the intel_pstate
> driver, and thus have questions related to it. Yes, I understand that,
> by default, there is only a "proportional" term. I have only read the
> code, but have not tried to modify it to see how it breaks.
>
> The goal of this e-mail is to determine whether we can explain
> https://bugzilla.kernel.org/show_bug.cgi?id=60727 and to audit the
> driver for other bugs. If I worked at Intel, I would have asked the
> same questions as a part of normal code review.
>
> 1. Usually, the output of the PID controller is directly used to
> control the process (in our case, this, naively, would be the
> performance MSR). However, in the current driver, the output of
> pid_calc is first quantized (by fp_toint(result) at the very end of
> the function) and then used as a number of steps to increase or
> decrease the MSR value - i.e. essentially integraded. This integration
> essentially makes a non-standard integral-doubleintegral-proportional
> type of controller instead of PID (and, due to only the P term being
> present by default, the result is ian integral-only controller with
> the quantization step before the integral).
>

The fp_toint() call is to return an integer instead of the fixed point
floating point number used in pid_calc().  I am unclear how this is an
integration.

pid_calc returns an error value that the MRS needs to be adjusted by and
not an MSR value since there are MANY SKU's with different pstate ranges.

> Why was the decision to quantize and then integrate the PID controller
> output made, and not the other way round? Why is the explicit
> integration step outside of the controller necessary at all, instead
> of letting a normal PI controller output (with different coefficients
> - i.e. leaving only the I term would get what we have now, minus
> quantization) directly control the MSR value?
>
> 2. In intel_pstate_get_scaled_busy(), there is this line:
>
>          busy_scaled = mul_fp(core_busy, div_fp(max_pstate, current_pstate));
>
> What is the physical meaning of the result - i.e. why does core_busy
> need to be upscaled by (max_pstate / current_pstate)? Why is this
> result chosen as something to stabilize (by comparing to the setpoint
> in the PID controller)?
>

The scaling is done to find out how busy the CPU is at the current P state.
i.e If the core is 60% busy and the P state is 60% of max then it is 100%
     busy in the P state and the P state should be increased

> I am asking because I don't quite understand the logic. Is the goal to
> ensure (by the PID regulator choosing the P-state) that the CPU is as
> close to 97% busy as possible, under the default policy?
>
> 3. Why is 97 chosen as a setpoint? What was the reasoning behind
> setting the setpoint to 109 before the change 2134ed4d6 (asking
> because 109 does not make sense as the "CPU busy percentage" setpoint
> in an integral-only controller, see question (1) why I am calling your
> controller integral-only)?
>

The 97% value goes along with the change to scaling off of max_pstate
instead of turbo_pstate.  The 97 works for the narrow P state bin size approx
2.5% of max_pstate/frequency.

> 4. Was any "well-established" procedure like Ziegler-Nichols tuning
> method tried to tune the coefficients of the PID controller? Were
> there any failed attempts?
>

This algorithm is for tuning linear systems and the changes in load are
anything but linear.  Changing the operating point (MSR) is instantaneous
also not linear.

> 5. Why is a PID controller (a thing that needs tuning, testing for
> stability, requires essentially-floating-point calculations and can
> provoke "I don't understand" e-mails such as this one) used at all?
> What were the arguments for choosing it over, e.g., the simple
> heuristic similar to what is in cpufreq_conservative.c?
>

The PID was chosen after implementation and evaluation of a number of algorithms
the PID had best the best power efficiency.  Is the PID the end all probably
not but in my testing it was the best I could come up with that fit the range
of workloads mobile/desktop/datacenter.

Are the default tuning parameters optimal for all workloads?  Clearly not but
neither are the the tuning parameters for any other governor (that I am aware
of) they were chosen to give good power efficiency for a range of workloads
and processor SKUs

> Note: I am not subscribed to the cpufreq list. Please CC: me on replies.
>

