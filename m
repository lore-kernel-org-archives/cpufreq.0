From: Arjan van de Ven <arjan@infradead.org>
Subject: Re: Improving High-Load Performance with the Ondemand Governor
 [PATCH ATTACHED]
Date: Fri, 17 Sep 2010 06:46:00 -0700
Message-ID: <20100917064600.5d478658@infradead.org>
References: <4C88EF04.1030908@verisign.com>
	<4C928094.7080207@verisign.com>
	<201009171125.44403.trenn@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <201009171125.44403.trenn@suse.de>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Renninger <trenn@suse.de>
Cc: David C Niemi <dniemi@verisign.com>, cpufreq@vger.kernel.org, discuss@lesswatts.org, linux-pm@lists.linux-foundation.org

On Fri, 17 Sep 2010 11:25:44 +0200
Thomas Renninger <trenn@suse.de> wrote:

> On the Opteron or Xeon system? That would mean that reducing frequency
> from OS still is an important power consumption knob even on latest
> Westmere systems.

it is for staying out of the turbo range. the turbo range is not power
efficient (but good for performance)

below turbo, the actual impact is a LOT less....

-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
