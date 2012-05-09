From: Yogesh Kumar <ykumar19874@gmail.com>
Subject: Question on CPU Frequency subsystem
Date: Wed, 9 May 2012 17:30:08 +0200
Message-ID: <CACpnD03GRrQ58h9+6zD8hH9hk41FdrfHpgSSGb13mdcNpqxX8w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=zLuJh5rrwJUNIqXLBtoh6KhJtIZwc8sYuS8Be3h/UH8=;
        b=dO2nuWwNHrs+PuQH0GPBXEydlwkniaQPMzUV3ecVVwK3KiNCdwCPEae5OG8HVnsWQn
         3BzbYIhnWk6gIGarCM+pM+j70XqLV7AoPD7rhXbVSBKwq3IN3XQ8E0u0Bg7SiqEVYFf/
         sYFoqyionWg12pS8kM2rUbqsGbWLtNrxAaHbxU3bklr6zkyB0e7coDbKOlEjyYDPu7XS
         x8cnkPLRX76wlDb9rqRJPYhbu2qcu5VFUTwFPMi+MzhQYDYYklfFuvKO/OhtFdpjrvea
         PKMoMNNzfmmXGUh8gNn/rj5PaI7z6zmTTA1BT4DomVtupgooZRGoOkrLdJyIHAuEQMIH
         OPuw==
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

Hi,

I had a question on CPU Frequency subsystem. As there are multiple
governors which can be set on different CPU cores. If we have 4 cores
lying under the one power domain and voltage rail and suppose governor
setting is:

cpu0: performance
cpu1: on demand
cpu2: on demand
cpu3: performance

Since All cores are lying under same power rails, as we set the cpu0
to performance governor which will set the cpu0 and cpu3 to maximum
frequency and hence sustainable voltage for that frequency but cpu1
and cpu2 are using on demand governor, suppose the load is low on cpu1
and cpu2 cores, therefore on demand governor will try to set the low
frequency and voltage based on the load. Since cpu0 is at high
frequency and cpu1 is at low frequency, which part of cpufreq system
will restrict the voltage to stay high as voltage rail is shared and
one cpu is running at low frequency and another at high frequency?

Regards
Yogesh
