From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [RFC PATCH 1/2] PM / OPP: add support to specify phandle of another
 node for OPP
Date: Tue, 30 Jul 2013 12:34:56 -0600
Message-ID: <51F80750.8030701@wwwdotorg.org>
References: <1375207217-4433-1-git-send-email-Sudeep.KarkadaNagesha@arm.com> <1375207217-4433-2-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1375207217-4433-2-git-send-email-Sudeep.KarkadaNagesha@arm.com>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sudeep KarkadaNagesha <Sudeep.KarkadaNagesha@arm.com>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Nishanth Menon <nm@ti.com>

On 07/30/2013 12:00 PM, Sudeep KarkadaNagesha wrote:
> From: Sudeep KarkadaNagesha <sudeep.karkadanagesha@arm.com>
> 
> If more than one similar devices share the same OPPs, currently we
> need to replicate the OPP entries in all the nodes.
> 
> Few drivers like cpufreq depend on physical cpu0 node to specify the
> OPPs and only that node is referred irrespective of the logical cpu
> accessing it. Alternatively to support cpuhotplug path, few drivers
> parse all the cpu nodes for OPPs. Instead we can specify the phandle
> of the node with which the current node shares the operating points.
> 
> This patch adds support to specify the phandle in the operating points
> of any device node, where the node specified by the phandle holds the
> actual OPPs.

> diff --git a/Documentation/devicetree/bindings/power/opp.txt b/Documentation/devicetree/bindings/power/opp.txt

> +Optional properties:
> +- operating-points-phandle: phandle to the device node with which this

That's a funny name. Bikeshedding a bit, how about shared-operating-points?

I haven't thought at all about whether this change conceptually makes sense.
