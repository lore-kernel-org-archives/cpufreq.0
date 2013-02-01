From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH 43 0/3] Kirkwoode cpufreq driver
Date: Fri, 1 Feb 2013 20:04:27 +0530
Message-ID: <CAKohpokjN8kx9Tan=wG4d0tdicWpb6DLN7o+rbX5f9oppJK7bA@mail.gmail.com>
References: <1359729096-15371-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1359729096-15371-1-git-send-email-andrew@lunn.ch>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jason Cooper <jason@lakedaemon.net>, rjw@sisk.pl, linux ARM <linux-arm-kernel@lists.infradead.org>, cpufreq@vger.kernel.org

On 1 February 2013 20:01, Andrew Lunn <andrew@lunn.ch> wrote:
> This patchset adds a cpufreq driver for Marvell Kirkwood SoCs.
>
> The changes to kirkwood_defconfig enable it and set the default
> governor to ondemand.

Wow! [PATCH 43 0/3] :)
It looks you are adding v4 manually to every patch? If yes, you need to
use following:

git format-patch A..B --cover-letter --subject-prefix="PATCH V4"
