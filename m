From: Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: support for software direct frequency throttling?
Date: Wed, 07 Aug 2013 14:38:55 -0500
Message-ID: <5202A24F.6040506@calxeda.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>

Is there an easy way to dynamically limit the maximum or minimum
frequencies available to a governor? I'm trying to support frequency
throttling in response to a thermal event (or theoretically to allow a
BMC to set a minimum frequency regardless of current load).

I looked into doing this last year and it required some QoS patches that
I don't think ever made it into the kernel.

Is there a straightforward way to do this right now? If not, is anyone
working on implementing this? If not, any preferences from the
maintainers on how I should implement?

Thanks,
Mark Langsdorf
Calxeda, Inc.
