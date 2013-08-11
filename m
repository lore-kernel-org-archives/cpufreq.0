From: "Alexander E. Patrakov" <patrakov@gmail.com>
Subject: Questions on the PID controller in the intel_pstate driver
Date: Sun, 11 Aug 2013 19:04:10 +0600
Message-ID: <CAN_LGv2EpaX+-gNpzSFw2Q1-ZS+R2rwt5SYVeHVGfRG+M4a+0g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=7FVKZuBGC1RLMeFiQjfCnrrbuo/unRnOhMetDorgETs=;
        b=r/RrNKdylcwqrzAuJtVKmsx9gTklobGr/33eESkTTsVLDmKnrM5BmVe2utCh3exCF2
         a2CnIu70+63bCsciz85PUThnSxr2BdWLeAuncWq1KxCmvA8NuINMkWh1COTW3PM8bBSq
         lGniaI8u62vMfVCTRXvZ9u/MR4yo5DHR4ml5pTnUrwCAQ6plJtA7WX/rbQhNMPgwLQK0
         2nT0CVB96IsUMM6aXfmylUiklTYK8O2MJeAHwvfcsWGqOyaPs/YZc/z1uBOpFabKJKNQ
         4RWfBOvx5qIbxKxLneiUdYG5BmTRW7uxTWZl/azNvXy+RRLeTzvi9cu+5zOkDdPxcrNm
         mNrg==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Brandewie <dirk.j.brandewie@intel.com>, cpufreq@vger.kernel.org

Hello.

I have noticed that there is a PID controller in the intel_pstate
driver, and thus have questions related to it. Yes, I understand that,
by default, there is only a "proportional" term. I have only read the
code, but have not tried to modify it to see how it breaks.

The goal of this e-mail is to determine whether we can explain
https://bugzilla.kernel.org/show_bug.cgi?id=60727 and to audit the
driver for other bugs. If I worked at Intel, I would have asked the
same questions as a part of normal code review.

1. Usually, the output of the PID controller is directly used to
control the process (in our case, this, naively, would be the
performance MSR). However, in the current driver, the output of
pid_calc is first quantized (by fp_toint(result) at the very end of
the function) and then used as a number of steps to increase or
decrease the MSR value - i.e. essentially integraded. This integration
essentially makes a non-standard integral-doubleintegral-proportional
type of controller instead of PID (and, due to only the P term being
present by default, the result is ian integral-only controller with
the quantization step before the integral).

Why was the decision to quantize and then integrate the PID controller
output made, and not the other way round? Why is the explicit
integration step outside of the controller necessary at all, instead
of letting a normal PI controller output (with different coefficients
- i.e. leaving only the I term would get what we have now, minus
quantization) directly control the MSR value?

2. In intel_pstate_get_scaled_busy(), there is this line:

        busy_scaled = mul_fp(core_busy, div_fp(max_pstate, current_pstate));

What is the physical meaning of the result - i.e. why does core_busy
need to be upscaled by (max_pstate / current_pstate)? Why is this
result chosen as something to stabilize (by comparing to the setpoint
in the PID controller)?

I am asking because I don't quite understand the logic. Is the goal to
ensure (by the PID regulator choosing the P-state) that the CPU is as
close to 97% busy as possible, under the default policy?

3. Why is 97 chosen as a setpoint? What was the reasoning behind
setting the setpoint to 109 before the change 2134ed4d6 (asking
because 109 does not make sense as the "CPU busy percentage" setpoint
in an integral-only controller, see question (1) why I am calling your
controller integral-only)?

4. Was any "well-established" procedure like Ziegler-Nichols tuning
method tried to tune the coefficients of the PID controller? Were
there any failed attempts?

5. Why is a PID controller (a thing that needs tuning, testing for
stability, requires essentially-floating-point calculations and can
provoke "I don't understand" e-mails such as this one) used at all?
What were the arguments for choosing it over, e.g., the simple
heuristic similar to what is in cpufreq_conservative.c?

Note: I am not subscribed to the cpufreq list. Please CC: me on replies.

-- 
Alexander E. Patrakov
