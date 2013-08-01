From: Michael Giardino <giardino@ece.gatech.edu>
Subject: BUG_ON(irqs_disabled()) in cpufreq.c
Date: Thu, 1 Aug 2013 08:38:48 -0400
Message-ID: <CAEL66Hib_KJ3=5Hi-=OAye=2pbQz_0-PcC6CicjP9n2Ng2KG9g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:from:date:x-google-sender-auth:message-id
         :subject:to:content-type;
        bh=2tpqTMiI8KsvYOp6jQz6JEt7TEvPqvGqRXA/P2bX5uU=;
        b=KnQ0S0AomoFyHgmx7Sv4akT8azJXdncMEOd+ZWvEqN6w35D3CRmw/GB3AByXGKE3ms
         zUydfBhSXffkyWL0kvcvE1nNRZTAmBCuLIhAmZVAttfoOAunqfSLpYK86S5hCxwzIs+x
         aP+W42dMQM77X+vxMRQ31aoher37BYVUfBO3A+emK1ANRJi+mebewXPOxjRmrBDskcwH
         sO1oahyyDl3N8FgDzURiQma64mTGKvHrIo8F0Hi2idsMRycdfRDu0yK9Nv5DlLtDc4CR
         nA/8chV7BtQna0rbLfBKV9ZgwmfqTNQzwzv2nOHaeZxMB7tKyT9QlQskOio1gcVsBio9
         wLLA==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi,

I hope this is the right spot to ask this.

Is there any way to change the cpu frequency using the cpufreq driver
from within an hrtimer callback function? I encounter a kernel panic
at cpufreq.c line 255 (260 in 3.9.5)

void __cpufreq_notify_transition(struct cpufreq_policy *policy,
253                 struct cpufreq_freqs *freqs, unsigned int state)
254 {
255         BUG_ON(irqs_disabled());


I'm assuming this is due to the cpufreq_notify_transition needs
interrupts to notify? Is there a way around this? It appears that
acpi-cpufreq.c is calling the notifier both before and after the
transition (CPUFREQ_PRECHANGE and CPUFREQ_POSTCHANGE).

Are there any frequency change functions that can operate without interrupts?

The background is this:

For the past few days I have been trying to get to the bottom of a
problem involving a nonSMP governor I have written. The goal of this
governor is to change the frequency on a predefined schedule (in the
ms scale). The basic breakdown is this:

1. The external scheduler computes schedules and then passes them to
the governor (with much code appropriated from the userspace governor)
via an exported function.
2. The governor sets the frequency, then sets a timer to call the next
frequency change when it goes off

In order to do this, I was using hrtimers. These timer's callback
functions run with interrupts disabled.

Michael Giardino
<giardino@ece.gatech.edu>
<michael.giardino@gmail.com>
