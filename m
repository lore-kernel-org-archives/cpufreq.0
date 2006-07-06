From: "Miroslav Vasic" <miroslav.vasic@gmail.com>
Subject: Frequency changes for XScale PXA255
Date: Thu, 6 Jul 2006 11:32:07 +0200
Message-ID: <b6cb966c0607060232k40b87efrd51c9bbdbaf8a105@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi, everyone.

I am trying to make a module for RT Linux which will periodically change
frequency and voltage of the microprocessor. Maybe I am going to ask
something what is I easy, so I am sorry for disturbance, but it is not easy
for me because my field of interesting is not kernel, so I need help. I have
following problem.

In the function init_module , which is started when the module is inserted,
I can set the maximum frequency for the policy and using the _
_cpufreq_driver_target function I can change frequency and the voltage of
the microprocessor to any value which is in the limits of the policy. After
that, I start a thread, which is periodic, and in the thread new values for
the frequency should be set.
When the periodic task begins, and the function __cpufreq_driver_target
starts executing, there is a message that it is not possible to continue
because of the line BUG_ON(irqs_disabled()); This line is in the function
cpufreq_notify_transition. It is obvious that it is because interrupts are
disabled, and I tried to enable interrupts before calling the function
__cpufreq_driver_target,
but it didn't help at all. I wanted to see what would happen if I delete
this line and the function was stopped on the next line,
down_read(&cpufreq_notifier_rwsem);.

My questions are:

1. Why does the function cpufreq_notify_transition need interrupts?
2. Does anybody can tell me what I have done wrong? I was trying to make
this module based on the cpufreq_ondemand, but it is obvious that I am doing
something wrong.
3. If I do not make mistake, governor serves only when it is started, turned
on and if its limits are changed, right? I can call driver function from any
other function, can't I?
4. I am a little confused, because from the init_module function I could
change frequency, and from the thread itself I couldn't. What should I check
to see what is different in those two cases? (I have already checked flags
of the micro and interrupts are disabled in the thread, and enabled in the
init_module)

Thanks in advance

Miroslav Vasic
