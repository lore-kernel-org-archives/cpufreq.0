From: Dave Jones <davej@redhat.com>
Subject: Re: [ANNOUNCE] CPUSpeed 1.2.1 released!
Date: Mon, 10 Jan 2005 17:54:12 -0500
Message-ID: <20050110225412.GE30515@redhat.com>
References: <41E1EE54.2050200@carlthompson.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <41E1EE54.2050200@carlthompson.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl Thompson <cet@carlthompson.net>
Cc: cpufreq@www.linux.org.uk

On Sun, Jan 09, 2005 at 06:54:12PM -0800, Carl Thompson wrote:
 > CPUSpeed 1.2.1 has, at long last, been released. There are many, many 
 > new features in this release including even greater efficiency and full 
 > multi-processor support. You can grab it at 
 > http://carlthompson.net/software/cpuspeed .

You'll need this bit..


--- cpuspeed-1.2.1/cpuspeed.cc~	2005-01-10 17:53:10.000000000 -0500
+++ cpuspeed-1.2.1/cpuspeed.cc	2005-01-10 17:53:21.000000000 -0500
@@ -769,7 +769,7 @@ main(unsigned argc, char * argv[])
                 "Author:\n"
                 "    Carl Thompson - cet [at] carlthompson.net  (copyright 2002 - 2005)\n"
                 "\n"
-                , NAME, VERSION, NAME, NAME
+                , NAME, VERSION, NAME
             );
             exit(0);
         }


Otherwise you see..

gcc -Wall -fno-exceptions -c -O2 cpuspeed.cc
cpuspeed.cc: In function `int main(unsigned int, char**)':
cpuspeed.cc:773: warning: too many arguments for format

		Dave
