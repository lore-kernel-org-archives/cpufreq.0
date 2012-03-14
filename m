From: Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: Using out of band messages to change min/max frequencies
Date: Wed, 14 Mar 2012 12:36:28 -0500
Message-ID: <4F60D71C.6070709@calxeda.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Does cpufreq currently support having an out-of-band agent
change the available minimum/maximum frequency and then
have the current frequency conform to the new values?

I experimented with a notifier routine (from an IPC
context) that used cpufreq_get_policy() and
cpufreq_update_policy(). I ran into two problems:
1) cpufreq_update_policy() would overwrite the
changes I made to the minimum/maximum settings
2) the driver->target call would be called within
the notifier context, and would explode when it
called its own notifiers.

driver->bios_limit doesn't seem like the right answer,
since it wouldn't be called if the current governor
has a static policy (ie performance, powersave).

Is there some better way to approach this? Ideally,
I'd like something like the ACPI _PPC concept, but
looking over that code I'm not sure it actually
limits the frequency correctly.

--Mark Langsdorf
Calxeda, Inc.
