From: "Alexander E. Patrakov" <patrakov@gmail.com>
Subject: Re: Questions on the PID controller in the intel_pstate driver
Date: Wed, 21 Aug 2013 12:34:02 +0600
Message-ID: <CAN_LGv0vPaJZPpAS-_sZ1wuYDYWCimAtppqbdW1D0AnyG9SEVQ@mail.gmail.com>
References: <CAN_LGv2EpaX+-gNpzSFw2Q1-ZS+R2rwt5SYVeHVGfRG+M4a+0g@mail.gmail.com>
	<5213AD0B.9060805@intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ICRgLt/0p8OlJPHPl5VLzj7syRPkDfprmIy7cqOAcf0=;
        b=XDm0NKsBmpra5PYOFYVhf3S+PY4gjYEov1S2oiuhuKLieDFWxIHACEUfi0zB5SXsak
         bKlMVhZubOYww2qfKKA4lhBgmlIidWe8/dV5tSc2AL0L2dN15CQylZitvMF8Vl8ygJfU
         qrv6Jm0X5tyi8q5KnT0atWOCDDRNkFNQQ8dANNh1yS2GppmKTmpQY64sJWbI9ecxxl93
         68M8o8pMLXoWK7Bxg/vkcauXDms2uPcqpK8BP7OzbnC3Yvjzg3FRkN+T5HO/19Be2Qwc
         eK1EDc8pAdiaQonMrEdjjGyRWKQIo7Szc0PzX1OrENKSDMFkhg6fuzFgBS5HjMmmi+TO
         Wy6A==
In-Reply-To: <5213AD0B.9060805@intel.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.brandewie@gmail.com>
Cc: Dirk Brandewie <dirk.j.brandewie@intel.com>, cpufreq@vger.kernel.org

2013/8/20 Dirk Brandewie <dirk.brandewie@gmail.com>:

(let me reorder the points, so that the answers that I am fully
satisfied with are at the top)
> On 08/11/2013 06:04 AM, Alexander E. Patrakov wrote:

>> 4. Was any "well-established" procedure like Ziegler-Nichols tuning
>> method tried to tune the coefficients of the PID controller? Were
>> there any failed attempts?
>
> This algorithm is for tuning linear systems and the changes in load are
> anything but linear.  Changing the operating point (MSR) is instantaneous
> also not linear.

Thanks for the answer, there is really nothing left to discuss about this point.

About the nonlinearity introduced by the discrete nature of MSR
changes - yes, this is also valid and relevant for point (1), below.

>> 5. Why is a PID controller (a thing that needs tuning, testing for
>> stability, requires essentially-floating-point calculations and can
>> provoke "I don't understand" e-mails such as this one) used at all?
>> What were the arguments for choosing it over, e.g., the simple
>> heuristic similar to what is in cpufreq_conservative.c?
>>
>
> The PID was chosen after implementation and evaluation of a number of
> algorithms
> the PID had best the best power efficiency.  Is the PID the end all probably
> not but in my testing it was the best I could come up with that fit the
> range
> of workloads mobile/desktop/datacenter.

OK.

>> 1. Usually, the output of the PID controller is directly used to
>> control the process (in our case, this, naively, would be the
>> performance MSR). However, in the current driver, the output of
>> pid_calc is first quantized (by fp_toint(result) at the very end of
>> the function) and then used as a number of steps to increase or
>> decrease the MSR value - i.e. essentially integraded. This integration
>> essentially makes a non-standard integral-doubleintegral-proportional
>> type of controller instead of PID (and, due to only the P term being
>> present by default, the result is ian integral-only controller with
>> the quantization step before the integral).
>>
>
> The fp_toint() call is to return an integer instead of the fixed point
> floating point number used in pid_calc().  I am unclear how this is an
> integration.

This is quantization, not integration.

> pid_calc returns an error value that the MRS needs to be adjusted by

Correct, and the "adjust by this value" logic is in
intel_pstate_pstate_increase() and intel_pstate_pstate_decrease().
This "adjust by this value" logic is what I call integration. And BTW,
the current code in intel_pstate_adjust_busy_pstate() after the call
to pid_calc() is just a very elaborate way to write this:

int target;
target = cpu->pstate.current_pstate + ctl;  /* that's what I call
integration of ctl */

intel_pstate_set_pstate(cpu, target);  /* note: it clamps
cpu->pstate.current_pstate, correctly */

so no separate code paths WRT increasing and decreasing the P-state are needed.

> and
> not an MSR value since there are MANY SKU's with different pstate ranges.

and this is what I (so far) disagree with. All your code does
(correctly) to work around many possible SKU's is to interpret the PID
(or, as I and D terms are set to zero by default, P-only) controller
output as a number of steps to increment the P-state by. What I am
saying is that:

1) the PID controller can do it for you, if you replace the
proportional term with the integral one and adjust the
integral-term-clamping logic (replace the hard-coded constant
int_tofp(30) with something related to intel_pstate_get_min_max());

2) doing so would also swap the order of integration and quantization
to the one that represents a simpler type of non-linearity
(quantization at the very end instead of quantization before
integration).

The same ugly stairstep type of non-linearity also applies to the
input of the PID controller, namely, in
intel_pstate_get_scaled_busy(), busy_scaled is a fixed-point number,
that is later converted to integer and then (in pid_calc) again to
fixed point. I think that such roundtrip is not needed, because it
only loses precision unnecessarily.

I think I should provide a series of patches (meant to be rejected,
with an explanation serving as the answer to my question) to better
illustrate my point, will do it later today or tomorrow.

>> 2. In intel_pstate_get_scaled_busy(), there is this line:
>>
>>          busy_scaled = mul_fp(core_busy, div_fp(max_pstate,
>> current_pstate));
>>
>> What is the physical meaning of the result - i.e. why does core_busy
>> need to be upscaled by (max_pstate / current_pstate)? Why is this
>> result chosen as something to stabilize (by comparing to the setpoint
>> in the PID controller)?
>>
>
> The scaling is done to find out how busy the CPU is at the current P state.
> i.e If the core is 60% busy and the P state is 60% of max then it is 100%
>     busy in the P state and the P state should be increased

OK. A patch with comments about the possible ranges of
cpu->samples[cpu->sample_ptr].{aperf, mperf,core_pct_busy} and
busy_scaled in the "60% of the max" P state and in the "110% of the
max" turbo P state would help future readers of this code.

>> I am asking because I don't quite understand the logic. Is the goal to
>> ensure (by the PID regulator choosing the P-state) that the CPU is as
>> close to 97% busy as possible, under the default policy?
>>
>> 3. Why is 97 chosen as a setpoint? What was the reasoning behind
>> setting the setpoint to 109 before the change 2134ed4d6 (asking
>> because 109 does not make sense as the "CPU busy percentage" setpoint
>> in an integral-only controller, see question (1) why I am calling your
>> controller integral-only)?
>>
>
> The 97% value goes along with the change to scaling off of max_pstate
> instead of turbo_pstate.  The 97 works for the narrow P state bin size
> approx
> 2.5% of max_pstate/frequency.

Let me reword to verify my understanding. You are saying that, before
this change, busy_scaled was overestimated by a factor of turbo_pstate
/ max_pstate, and so was the desired setpoint, thus bringing it out of
the 100% range. Is that right?

-- 
Alexander E. Patrakov
