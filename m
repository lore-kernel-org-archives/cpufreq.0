From: "Gabor Z. Papp" <gzp@papp.hu>
Subject: linking cpufrequtils against libcpufreq.a
Date: Thu, 11 Nov 2010 18:44:09 +0100
Message-ID: <x6iq03n4ba@gzp>
References: <x67hgkrp8v@gzp>
	<20101111145322.GA9488@comet.dominikbrodowski.net> <x6mxpfn4n2@gzp>
	<20101111173852.GA12139@isilmar-3.linta.de>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

lo lo,

I would like to link cpufreq utils against static libcpufreq.a

I have tried extracting libcpufreq.a from libcpufreq.so.0.0.0 with the
command "ar -cvq libcpufreq.a libcpufreq.so.0.0.0", and linked the
binaries against the lib, but the .a archive have reference for
libcpufreq.so and the produced binaries show dependency against
libcpufreq.so.

Someone could help how could I fix this problem (instead of asking why
I would like to link against static lib :-)

Thanks.
